import java.util.Arrays;

//用了builtin的排序算法；不用排序的话就需要一个额外数组，同时遍历nums1和nums2
public class Solution {
    public static void merge(int[] nums1, int m, int[] nums2, int n) {
        for (int i = m, k = 0; i < nums1.length; i += 1, k += 1) {
            nums1[i] = nums2[k];
        }
        Arrays.sort(nums1);
    }
    public static void main(String[] argv) {
        int[] nums1 = {1,2,3,0,0,0};
        int[] nums2 = {2,5,6};
        merge(nums1, 3, nums2, 3);
        for (int m: nums1) {
            System.out.println(m);
        }
    }
}

