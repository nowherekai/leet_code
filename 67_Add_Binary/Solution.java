public class Solution {
  public static void main (String[] args) {
  }

    //java必须操作字符串，然后按位相加
    //TODO： use java
  public String addBinary(String a, String b) {
      char[] result = new char[Math.max(a.length(), b.length())];
      int carryBit = 0;
      for (int aIndex= a.length() - 1, bIndex = b.length() - 1; aIndex >= 0 || bIndex >= 0; aIndex -= 1, bIndex -= 1) {
          int charOfA = aIndex <= 0 ? 0 : a.charAt(aIndex);
          int charOfB = bIndex <= 0 ? 0 : b.charAt(bIndex);
      }
      return null;
  }
}
