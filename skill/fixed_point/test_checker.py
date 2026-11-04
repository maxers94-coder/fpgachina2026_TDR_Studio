import unittest
from check_correlation import compute
class CheckerTests(unittest.TestCase):
 def test_golden(self):self.assertEqual(compute([4,8,12,16,20,24],[0]*6,[1,-1,1],4,2)['dc_numerator'],[4,12,20,28])
 def test_baseline_cancellation(self):self.assertEqual(compute([9,2,-4],[9,2,-4],[2],3,2)['correlation'],[0,0,0])
 def test_negative_sign(self):self.assertEqual(compute([-2,-4,-8],[0]*3,[1,1],2,2)['correlation'],[-6,-12])
 def test_wide_accumulator(self):self.assertEqual(compute([2**30]*3,[0]*3,[2**20]*2,2,2)['correlation'],[2**51,2**51])
 def test_bad_dimensions(self):
  with self.assertRaises(ValueError):compute([1,2],[0],[1],2,1)
 def test_bad_dc_interval(self):
  with self.assertRaises(ValueError):compute([1,2],[0,0],[1],2,3)
if __name__=='__main__':unittest.main()
