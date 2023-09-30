---
title: Top leetcode
date: 2023-07-18T15:10:44+05:30
draft: false
---

1. Two Sum 

```C++
#include <vector>
#include <unordered_map>
#include <iostream>

std::vector<int> twoSum(std::vector<int>& nums, int target)
{
    std::unordered_map<int, int> indexMap;  // To store the value and its index
    std::vector<int> result;  // To store the result
    
    for (int i = 0; i < nums.size(); ++i) {
        int complement = target - nums[i];  // Calculate the complement of the current number
        
        // If the complement exists in the map, we have found a pair that adds up to the target
        if (indexMap.find(complement) != indexMap.end()) {
            result.push_back(indexMap[complement]);
            result.push_back(i);
            return result;  // Return the indices of the two numbers
        }
        
        // Otherwise, insert the current number and its index into the map
        indexMap[nums[i]] = i;
    }
    
    return result;  // Return an empty vector if no solution is found (though there's always a solution according to the problem statement)
}

int main() {
    std::vector<int> nums = {2, 7, 11, 15};
    int target = 9;
    std::vector<int> result = twoSum(nums, target);
    std::cout << "Indices: " << result[0] << ", " << result[1] << std::endl;
    return 0;
}

```

Add Two Numbers:

Problem statement : 

You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.


Solution :


	int c = 0;
    ListNode newHead(0);
    ListNode *t = &newHead;
    while(c || l1 || l2) {
        c += (l1? l1->val : 0) + (l2? l2->val : 0);
        t->next = new ListNode(c%10);
        t = t->next;
        c /= 10;
        if(l1) l1 = l1->next;
        if(l2) l2 = l2->next;
    }
    return newHead.next;
	
	
	
	
======================================

3. Longest Substring without repeating charater :


Problem statement :


Solution :
int lengthOfLongestSubstring(string s)
    {

        vector<int> v(256,-1);
        int start=-1,max_length=0;
        for(int i=0;i<s.size();i++)
        {
            if(v[s[i]]>start)
            {
                start = v[s[i]];
            }
            v[s[i]] = i;
            max_length = max(max_length, i-start);
        }
        return max_length;

}


=========================================

7. Reverse Integer :

Problem statement :

Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

```c++
int reverse(int x)
    {
        long long int num =0,temp=x;
        while(temp!=0)
        {
            num = num*10+temp%10;
            temp/=10;
        }
        return (temp>INT_MAX || temp<INT_MIN)?0:num;
        
        
    }
	
```

8. String to integer (atoi)

Problem statement : mplement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).

The algorithm for myAtoi(string s) is as follows:

Read in and ignore any leading whitespace.
Check if the next character (if not already at the end of the string) is '-' or '+'. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
Read in next the characters until the next non-digit character or the end of the input is reached. The rest of the string is ignored.
Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater than 231 - 1 should be clamped to 231 - 1.
Return the integer as the final result.
Note:

Only the space character ' ' is considered a whitespace character.
Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.


Solution :
int myAtoi(string s) {
        int len = s.size();
        double num = 0;
        int i=0;
        while(s[i] == ' '){
            i++;
        }
        bool positive = s[i] == '+';
        bool negative = s[i] == '-';
        positive == true ? i++ : i;
        negative == true ? i++ : i;
        while(i < len && s[i] >= '0' && s[i] <= '9'){
            num = num*10 + (s[i]-'0');
            i++;
        }
        num = negative ? -num : num;
        cout<<num<<endl;
        num = (num > INT_MAX) ? INT_MAX : num;
        num = (num < INT_MIN) ? INT_MIN : num;
        cout<<num<<endl;
        return int(num);
    }
	
11. 


Problem Statement :

Container With Most Water

You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container



Solutions :

 long long trappingWater(int arr[], int n)
    {
        int left[n-1]={0};
        int right[n-1]={0};
        left[0]=arr[0];
        right[n-1]=arr[n-1];
        
        for(int i=1;i<n;i++)
        {
            left[i]= max(left[i-1],arr[i]);
        }
        
        for(int i=n-2;i>=0;i--)
        {
            right[i]= max(right[i+1],arr[i]);
        }
        long long int water = 0;
        
        for(int i=1;i<n;i++)
        {
            water+=(min(right[i],left[i])-arr[i]);
        }
        
        return water;
    }
	
	
	=================================
	


13. Roman to Integer

Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000

or example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9. 
X can be placed before L (50) and C (100) to make 40 and 90. 
C can be placed before D (500) and M (1000) to make 400 and 900.
Given a roman numeral, convert it to an integer.


Solution :

nt romanToInt(string s) 
{
    unordered_map<char, int> T = { { 'I' , 1 },
                                   { 'V' , 5 },
                                   { 'X' , 10 },
                                   { 'L' , 50 },
                                   { 'C' , 100 },
                                   { 'D' , 500 },
                                   { 'M' , 1000 } };
                                   
   int sum = T[s.back()];
   for (int i = s.length() - 2; i >= 0; --i) 
   {
       if (T[s[i]] < T[s[i + 1]])
       {
           sum -= T[s[i]];
       }
       else
       {
           sum += T[s[i]];
       }
   }
   
   return sum;
}


===============================


 Longest Common Prefix

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

 

Example 1:

Input: strs = ["flower","flow","flight"]
Output: "fl"

Solution :


The code below is very much self explanatory.

We first sort the array of strings.
Then, we choose the first and last string in the array. [They are supposed to be the most different among all the pairs of strings in the sorted array]
We just compare how many common characters match from index i = 0 of these two strings.
class Solution {
public:
    string longestCommonPrefix(vector<string>& str) {
        int n = str.size();
        if(n==0) return "";
        
        string ans  = "";
        sort(begin(str), end(str));
        string a = str[0];
        string b = str[n-1];
        
        for(int i=0; i<a.size(); i++){
            if(a[i]==b[i]){
                ans = ans + a[i];
            }
            else{
                break;
            }
        }
        
        return ans;
        
    }
};


======================

5. 3Sum

Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.

 

Example 1:

Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Explanation: 
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
The distinct triplets are [-1,0,1] and [-1,-1,2].
Notice that the order of the output and the order of the triplets does not matter.




Solution :


	Using 2 Pointer :
	
	
	
	vector<vector<int>> threeSum(vector<int>& nums) {
	std::vector<vector<int>> result;
	if (nums.empty()) {
		return result;
	}

	std::size_t n_size = nums.size();
	std::sort(nums.begin(), nums.end());
	for (int i = 0; i < n_size; ++i) {
		// all numbers from now on will be greater than 0, no point in continuing
		if (nums[i] > 0) break;

		// we have seen this number & combo before; skip
		if (i > 0 and nums[i] == nums[i-1]) continue;

		int left = i+1, right = n_size - 1;
		while (left < right) {
			int sum = nums[i] + nums[left] + nums[right];
			if (sum < 0) {
				++left;
			} else if (sum > 0) {
				--right;
			} else {
				result.push_back({nums[i], nums[left], nums[right]});
				int last_left = nums[left], last_right = nums[right];
				// we have seen this number & combo before; skip
				while (left < right && nums[left] == last_left) ++left;
				while (left < right && nums[right] == last_right) --right;
			}
		}

	}
	return result;
}


19. Remove the nth node from linked list :


ListNode* removeNthFromEnd(ListNode* head, int n)
    {

        // explanation : https://leetcode.com/problems/remove-nth-node-from-end-of-list/solutions/8843/c-solution-easy-to-understand-with-explanations/

         if (!head)
        return nullptr;

    ListNode new_head(-1);
    new_head.next = head;

    ListNode *slow = &new_head, *fast = &new_head;

    for (int i = 0; i < n; i++)
        fast = fast->next;

    while (fast->next) 
    {
        fast = fast->next;
        slow = slow->next;
    }

    ListNode *to_de_deleted = slow->next;
    slow->next = slow->next->next;
    
   // delete to_be_deleted;

    return new_head.next;
        
    }
	
	
20 . Valid Parenthesis :


Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Every close bracket has a corresponding open bracket of the same type.
 

Example 1:

Input: s = "()"
Output: true


Solution :


bool isValid(string s)
    {
        stack<char>st;
        int n=s.length();
        for(int i=0;i<n;i++)
        {
            if(s[i]=='('||(s[i]=='[')||(s[i]=='{'))
            {
                st.push(s[i]);
            }
            else if(st.empty()==true)
            {
                return false;
            }
           else
                {
                    if((st.top()=='('&&(s[i]!=')')) || (st.top()=='['&&(s[i]!=']')) || (st.top()=='{'&&(s[i]!='}')) )
                    {
                        return false;
                    }
                    else
                    {
                        st.pop();
                    }
                }
        }
    
       return st.empty();
    }
	
	
	==========================
	
21. Merge Two sorted lsits (ll)

You are given the heads of two sorted linked lists list1 and list2.

Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.

class Solution {
public:
    ListNode *mergeTwoLists(ListNode *l1, ListNode *l2) {
        ListNode dummy(INT_MIN);
        ListNode *tail = &dummy;
        
        while (l1 && l2) {
            if (l1->val < l2->val) {
                tail->next = l1;
                l1 = l1->next;
            } else {
                tail->next = l2;
                l2 = l2->next;
            }
            tail = tail->next;
        }

        tail->next = l1 ? l1 : l2;
        return dummy.next;
    }
};


============================

22. Remove dublicates :

Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.

Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:

Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
Return k.

Solution:



int removeDuplicates(vector<int>& nums)
    {
        
        int count = 0,n=nums.size();

        for(int i = 1; i < n; i++)
        {
            if(nums[i] == nums[i-1])
            {
                count++;
            }
            else
            {
                nums[i-count] = nums[i];
            }
        }
        return n-count;
        
    }

===========================

28 . Find the index of the first occurence in the string 


Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.

Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:

Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
Return k.


Solution :

Can be solve in O(m+n) time with KMP , with brute :

O(m*n)

 public int strStr(String haystack, String needle) {
        if(haystack == null || needle == null || needle.length() > haystack.length()) return -1;

        int len = haystack.length(), i = 0, j = 0, pos = 0;
        while(i < len && j < needle.length()) {
            if(haystack.charAt(i++) == needle.charAt(j)) {
                j++;
            } else {
                i = i - j;
                j = 0;
                pos = i;
            }
        }
        return j == needle.length()? pos : -1;
    }



====================

	
	