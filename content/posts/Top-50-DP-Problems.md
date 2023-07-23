---
title: Top 50 DP Questions
date: 2023-07-18T15:10:44+05:30
draft: false
---


List Of Questions:


## **Subset Sum Problem**


Given an array of non-negative integers, and a value sum, determine if there is a subset of the given set with sum equal to given sum. 

Example 1:

Input:
N = 6
arr[] = {3, 34, 4, 12, 5, 2}
sum = 9
Output: 1 
Explanation: Here there exists a subset with
sum = 9, 4+3+2 = 9.


## Solution

This problem is similar to Knapsack Problem.

### Code (C++)

```cpp
    bool isSubsetSum(vector<int>arr, int sum)
    {
        
        
       int n=arr.size();
       bool t[n+1][sum+1]={true};
       
       // makae first row as false, as with empty sack you cant make any sum (except 0)
       for(int j=1;j<=sum;j++)
       {
            t[0][j]=false;
       }
       
       for(int i=1;i<=n;i++)
       {
           for(int j=1;j<=sum;j++)
            {
                if(arr[i-1]<=j)
                {
                    // this is just derived from knapsack as here also we are filling knapsack 
                    // such that our sum is maximum 
                    t[i][j] = t[i-1][j]||t[i-1][j-arr[i-1]];
                }
                else
                {
                    t[i][j]=t[i-1][j];
                }
               
           }
       }
       
       return t[n][sum];
   
    }
   
```

## **Longest Common Subsequence**
Given two strings, find the length of longest subsequence present in both of them. Both the strings are in uppercase latin alphabets.

Example 1:

Input:
A = 6, B = 6
str1 = ABCDGH
str2 = AEDFHR
Output: 3
Explanation: LCS for input strings “ABCDGH” and “AEDFHR” is “ADH” of length 3.



## Solution



### Code (C++)

```cpp
    int lcs(int x, int y, string s1, string s2)
    {
        // your code here
        
        vector<vector<int>>dp(x+1,vector<int>(y+1,0));
        
        
        for(int i=1;i<=x;i++)
        {
            for(int j=1;j<=y;j++)
            {
                if(s1[i-1]==s2[j-1])
                {
                    dp[i][j] = 1 + dp[i-1][j-1];
                }
                else
                {
                    dp[i][j] = max(dp[i-1][j],dp[i][j-1]);
                }
            }
        }
        
        return dp[x][y];
    }
```

