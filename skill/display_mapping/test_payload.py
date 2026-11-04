import unittest
from check_payload import check,fnv1a
class PayloadTests(unittest.TestCase):
 def test_wire_reversal(self):self.assertEqual(check([0,64,255],[255,64,0],True)['status'],'PASS')
 def test_wrong_direction(self):self.assertEqual(check([0,64,255],[255,64,0])['status'],'FAIL')
 def test_truncation(self):self.assertEqual(check([0,1,2],[0,1])['status'],'FAIL')
 def test_fnv_known(self):self.assertEqual(fnv1a([97]),'E40C292C')
 def test_bad_byte(self):
  with self.assertRaises(ValueError):fnv1a([256])
if __name__=='__main__':unittest.main()
