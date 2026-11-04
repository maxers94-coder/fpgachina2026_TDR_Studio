"""Check byte-valued display payload order without assuming a particular screen."""
import argparse,json,sys
from pathlib import Path
def fnv1a(values):
 h=2166136261
 for value in values:
  if not isinstance(value,int) or isinstance(value,bool) or not 0<=value<=255:raise ValueError('Byte payload expected.')
  h=((h^value)*16777619)&0xffffffff
 return f'{h:08X}'
def check(expected,actual,reverse=False):
 fnv1a(expected);fnv1a(actual)
 logical=list(reversed(actual)) if reverse else actual
 bad=[i for i,(a,b) in enumerate(zip(expected,logical)) if a!=b]
 return {'status':'PASS' if expected==logical else 'FAIL','expected_count':len(expected),'actual_count':len(actual),'first_mismatches':bad[:10],'logical_fnv1a':fnv1a(logical),'wire_fnv1a':fnv1a(actual)}
if __name__=='__main__':
 a=argparse.ArgumentParser();a.add_argument('input',type=Path);a.add_argument('--reverse',action='store_true');o=a.parse_args();j=json.loads(o.input.read_text('utf-8'));r=check(j['expected'],j['actual'],o.reverse);print(json.dumps(r));sys.exit(r['status']!='PASS')
