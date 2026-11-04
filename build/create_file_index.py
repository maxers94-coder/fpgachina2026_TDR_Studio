"""Maintainer-only resealing utility. This is not a replacement for verification."""
from pathlib import Path
import argparse,hashlib,json,os,re
ROOT=Path(__file__).resolve().parents[1]
EXCLUDE_PREFIXES=('build/_runs/','build/_restored/','build/_host_restored/','build/_verification/','board/captures/','.git/')
INDEX='build/provenance/file_index.json'

def fs(p):
 s=str(Path(p).absolute());prefix=chr(92)*2+'?'+chr(92)
 return prefix+s if os.name=='nt' and not s.startswith(prefix) else s

def digest(p):
 h=hashlib.sha256()
 with open(fs(p),'rb') as f:
  for b in iter(lambda:f.read(1024*1024),b''):h.update(b)
 return h.hexdigest()

def files():
 for parent,dirs,names in os.walk(fs(ROOT)):
  dirs[:]=[d for d in dirs if d!='__pycache__']
  for name in names:
   s=os.path.join(parent,name);prefix=chr(92)*2+'?'+chr(92)
   p=Path(s[len(prefix):] if s.startswith(prefix) else s)
   rel=p.relative_to(ROOT).as_posix()
   if rel==INDEX or rel.endswith('.pyc') or rel.startswith(EXCLUDE_PREFIXES):continue
   yield rel,p

def main():
 a=argparse.ArgumentParser(description=__doc__);a.add_argument('--reseal',action='store_true',required=True);a.parse_args()
 source=json.loads((ROOT/'build/provenance/source_map.json').read_text('utf-8'))
 original={e['path']:e for e in source['files']};entries=[];counts={};largest=[]
 for rel,p in sorted(files()):
  if not rel.isascii() or any(not re.fullmatch(r'[A-Za-z0-9._-]+',part) for part in Path(rel).parts):raise ValueError('Nonportable path: '+rel)
  size=os.stat(fs(p)).st_size
  if rel in original:
   if size!=original[rel]['bytes']:raise ValueError('Original size changed: '+rel)
   sha=original[rel]['sha256']
  else:sha=digest(p)
  entries.append({'path':rel,'bytes':size,'sha256':sha});group=rel.split('/')[0];counts[group]=counts.get(group,0)+1
 known={e['path'] for e in entries}
 if set(original)-known:raise ValueError('Missing original files: '+str(sorted(set(original)-known)[:10]))
 out={'schema':'TDR_CURRENT_FILE_INDEX_1','date':'2026-11-03','indexed_files':len(entries),'bytes':sum(e['bytes'] for e in entries),'files_by_root':counts,'mapped_build_inputs':len(source['files']),'capture_files':source['measurement_files'],'excluded':'The index itself, generated scratch outputs and Python caches; all mapped build inputs are included.','files':entries}
 (ROOT/INDEX).write_text(json.dumps(out,indent=2),encoding='utf-8')
 print(json.dumps({k:v for k,v in out.items() if k!='files'}))
 print('Run build/verify_project.py to read and hash every indexed file; build-input hashes were retained from the source map.')
if __name__=='__main__':main()
