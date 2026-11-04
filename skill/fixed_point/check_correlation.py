"""Portable integer-domain golden correlation and DC-correction checker."""
import argparse,json,sys
from pathlib import Path
def compute(samples,baseline,template,count,dc_count):
 if not all(isinstance(a,list) and all(isinstance(x,int) and not isinstance(x,bool) for x in a) for a in [samples,baseline,template]):raise ValueError('Arrays must contain integers.')
 if len(samples)!=len(baseline) or not template or count<1 or count+len(template)-1>len(samples):raise ValueError('Invalid sample, baseline, template or output dimensions.')
 d=[x-b for x,b in zip(samples,baseline)]
 if dc_count<1 or dc_count>len(d):raise ValueError('Invalid DC estimation interval.')
 corr=[sum(d[k+i]*v for i,v in enumerate(template)) for k in range(count)]
 dc=sum(d[:dc_count]);num=[dc_count*x-dc*sum(template) for x in corr]
 return {'correlation':corr,'dc_numerator':num,'dc_denominator':dc_count}
def main():
 a=argparse.ArgumentParser();a.add_argument('input',type=Path);o=a.parse_args();j=json.loads(o.input.read_text('utf-8'));r=compute(j['samples'],j['baseline'],j['template'],j['count'],j['dc_count'])
 mismatches=[]
 for k in ['correlation','dc_numerator']:
  expected=j.get('expected_'+k)
  if expected is not None and expected!=r[k]:mismatches.append(k)
 r.update(status='FAIL' if mismatches else 'PASS',mismatches=mismatches);print(json.dumps(r));return bool(mismatches)
if __name__=='__main__':sys.exit(main())
