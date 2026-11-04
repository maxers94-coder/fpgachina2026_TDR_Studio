"""Check the current project files, build-input coverage and boot image."""
from pathlib import Path
import hashlib,json,re,sys,os
ROOT=Path(__file__).resolve().parents[1]
def digest(p):
 h=hashlib.sha256();s=str(p.absolute());prefix=chr(92)*2+'?'+chr(92)
 with open(prefix+s if os.name=='nt' else s,'rb') as f:
  for b in iter(lambda:f.read(1024*1024),b''):h.update(b)
 return h.hexdigest()
def main():
 index=json.loads((ROOT/'build/provenance/file_index.json').read_text('utf-8'))
 errors=[]
 for i,e in enumerate(index['files']):
  p=ROOT/e['path']
  try:
   s=str(p.absolute());prefix=chr(92)*2+'?'+chr(92)
   if os.stat(prefix+s if os.name=='nt' else s).st_size!=e['bytes'] or digest(p)!=e['sha256']:errors.append(e['path'])
  except OSError:errors.append(e['path'])
  if i and i%8000==0:print('CHECKED',i,flush=True)
 m=json.loads((ROOT/'build/provenance/source_map.json').read_text('utf-8'))
 if len(m['files'])!=m['mapped_files']:errors.append('build_input_count')
 capture_count=sum(x['original'].startswith('workspace/vitis_echo200_hmi_ws/captures/') for x in m['files'])
 if capture_count!=m['measurement_files']:errors.append('measurement_count')
 indexed={e['path']:e for e in index['files']}
 for e in m['files']:
  x=indexed.get(e['path'])
  if x is None or x['bytes']!=e['bytes'] or x['sha256']!=e['sha256']:errors.append('source_map:'+e['path'])
 boot=digest(ROOT/'board/sd_boot/boot.bin')
 if boot!='1c8f01b0a4fbd2c8f1c90321c280b8243512dc7aea370b8ff105122a03278f6e':errors.append('boot_identity')
 report={'status':'PASS' if not errors else 'FAIL','indexed_files':len(index['files']),'mapped_build_inputs':len(m['files']),'capture_files':capture_count,'boot_sha256':boot,'errors':errors[:50]}
 out=ROOT/'build/_verification';out.mkdir(exist_ok=True);(out/'last_check.json').write_text(json.dumps(report,indent=2),'utf-8');print(json.dumps(report));return bool(errors)
if __name__=='__main__':sys.exit(main())
