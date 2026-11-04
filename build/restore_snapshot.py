"""Prepare the current build inputs with the filenames and layout expected by the tools."""
from pathlib import Path, PurePosixPath
import argparse,hashlib,json,os,shutil
ROOT=Path(__file__).resolve().parents[1]
W='workspace/vitis_echo200_hmi_ws/'
def longpath(p):
 s=str(Path(p).absolute());prefix=chr(92)*2+'?'+chr(92)
 return prefix+s if os.name=='nt' and not s.startswith(prefix) else s
def digest(p):
 h=hashlib.sha256()
 with open(longpath(p),'rb') as f:
  for b in iter(lambda:f.read(1024*1024),b''):h.update(b)
 return h.hexdigest()
def selected(n,scope):
 if scope=='all':return True
 if scope=='app':return n.startswith((W+'echo200_hmi_auto_distance_app/src/',W+'echo200_hmi_platform/export/','tools/'))
 if scope=='pl':return n.startswith(tuple(W+'echo200_ps_integration/'+x+'/' for x in ['rtl','constraints','scripts','tmp','sim','vectors']))
 if scope=='host':return n.startswith((W+'echo200_hmi_auto_distance_app/src/',W+'pn_dev/',W+'captures/')) and not n.lower().endswith(('.exe','.o','.obj','.pyc','.d','.su','.elf'))
 raise ValueError(scope)
def safe_join(root,rel):
 q=PurePosixPath(rel)
 if q.is_absolute() or '..' in q.parts or any(':' in x for x in q.parts):raise ValueError('Unsafe original path')
 p=root.joinpath(*q.parts)
 if not p.resolve().is_relative_to(root.resolve()):raise ValueError('Path escapes output')
 return p
def restore(output,scope):
 output=Path(output).resolve()
 if output==ROOT or ROOT.is_relative_to(output):raise ValueError('Choose an isolated output directory, not the project root or its parent.')
 info=json.loads((ROOT/'build/provenance/source_map.json').read_text('utf-8'))
 count=0
 for entry in info['files']:
  if not selected(entry['original'],scope):continue
  src=ROOT/entry['path'];dest=safe_join(output,entry['original'])
  if not os.path.isfile(longpath(src)):raise FileNotFoundError('Missing project build input: '+entry['path'])
  if digest(src)!=entry['sha256']:raise ValueError('Packaged file changed: '+entry['path'])
  if os.path.exists(longpath(dest)):
   if digest(dest)!=entry['sha256']:raise FileExistsError('Preserving modified output; choose a fresh output: '+str(dest))
  else:
   os.makedirs(longpath(dest.parent),exist_ok=True);shutil.copyfile(longpath(src),longpath(dest))
  count+=1
 return {'status':'RESTORE_PASS','scope':scope,'count':count,'output':str(output)}
if __name__=='__main__':
 a=argparse.ArgumentParser();a.add_argument('--output',type=Path,default=ROOT/'build/_restored');a.add_argument('--scope',choices=['all','app','pl','host'],default='all');o=a.parse_args();print(json.dumps(restore(o.output,o.scope),ensure_ascii=False))
