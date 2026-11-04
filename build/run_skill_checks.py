"""Run the portable skill examples, including a required failing direction example."""
from pathlib import Path
import json,subprocess,sys
ROOT=Path(__file__).resolve().parents[1]

def main():
 out=ROOT/'build/evidence/current_packaging';out.mkdir(parents=True,exist_ok=True)
 cases=[
  ('fixed_point_units',['-m','unittest','discover','-s','skill/fixed_point','-p','test_checker.py','-v'],0),
  ('display_units',['-m','unittest','discover','-s','skill/display_mapping','-p','test_payload.py','-v'],0),
  ('fixed_point_example',['skill/fixed_point/check_correlation.py','skill/fixed_point/example.json'],0),
  ('display_reversed_example',['skill/display_mapping/check_payload.py','skill/display_mapping/example.json','--reverse'],0),
  ('display_wrong_direction_rejected',['skill/display_mapping/check_payload.py','skill/display_mapping/example.json'],1)
 ]
 results=[];logs=[]
 for name,args,expected in cases:
  p=subprocess.run([sys.executable,*args],cwd=ROOT,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
  results.append({'name':name,'exit_code':p.returncode,'expected_exit_code':expected,'pass':p.returncode==expected})
  logs.append(name+'\n'+p.stdout+'\n')
 (out/'skill_tests.txt').write_text('\n'.join(logs),encoding='utf-8')
 report={'status':'PASS' if all(x['pass'] for x in results) else 'FAIL','unit_cases':11,'cli_cases':3,'results':results}
 (out/'skill_checks.json').write_text(json.dumps(report,indent=2),encoding='utf-8');print(json.dumps(report));return report['status']!='PASS'
if __name__=='__main__':sys.exit(main())
