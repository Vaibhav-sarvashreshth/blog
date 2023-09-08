---
title: Top 50 DP Questions
date: 2023-07-18T15:10:44+05:30
draft: false
---


## List Of Questions:

1. [Subset Sum Problem](#subset-sum-problem)
2. [Longest Common Subsequence](#longest-common-subsequence)
3. [Longest Increasing Subsequence](#longest-increasing-subsequence)
4. [Edit Distance](#edit-distance)
5. [Longest Path In Matrix](#longest-path-in-matrix)
6. [Optimal Strategy for a Game](#optimal-strategy-for-a-game)
7. [0-1 Knapsack Problem](#0-1-knapsack-problem)
8. [Shortest Common Supersequence](#shortest-common-supersequence)
9. [Partition problem](#partition-problem)
10. [Rod Cutting](#rod-cutting)
11. [Coin change problem](#coin-change-problem)
12. [Word Break Problem](#word-break-problem)
13. [Dice Throw Problem](#dice-throw-problem)
14. [Box Stacking](#box-stacking)
15. [Egg Dropping Puzzle](#egg-dropping-puzzle)
16. [Max length chain](#max-length-chain)
17. [Longest Common Substring](#longest-common-substring)
18. [Interleaved strings](#interleaved-strings)
19. [Maximum sum increasing subsequence](#maximum-sum-increasing-subsequence)
20. [Minimum number of jumps](#minimum-number-of-jumps)
21. [Count subsequences of type a^i, b^j, c^k](#count-subsequences-of-type-a^i-b^j-c^k)
22. [Get Minimum Squares](#get-minimum-squares)
23. [Nth Fibonacci Number](#nth-fibonacci-number)
24. [Longest Palindromic Substring](#longest-palindromic-substring)
25. [Total Decoding Messages](#total-decoding-messages)
26. [Unique BST’s](#unique-bst’s)
27. [Player with max score](#player-with-max-score)
28. [Form a palindrome](#form-a-palindrome)
29. [Word Wrap Problem](#word-wrap-problem)
30. [Count Palindromic Subsequences](#count-palindromic-subsequences)
31. [Minimum time to finish tasks without skipping two consecutive](#minimum-time-to-finish-tasks-without-skipping-two-consecutive)
32. [Minimum Partition](#minimum-partition)
33. [Boolean Parenthesization Problem](#boolean-parenthesization-problem)
34. [Matrix Chain Multiplication](#matrix-chain-multiplication)


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
       
       // make first row as false, as with empty sack you cant make any sum (except 0)
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

## **Longest Increasing Subsequence**

Given an array of integers, find the length of the longest (strictly) increasing subsequence from the given array.

Example 1:

Input:
N = 16
A = {0,8,4,12,2,10,6,14,1,9,5,13,3,11,7,15}
Output: 
6
Explanation:
There are more than one LIS in this array. One such Longest increasing subsequence is {0,2,6,9,13,15}.


## Solution
Dynamic Programming Approach :
    This approach will work in O(n^2) time, where n is the length of the input array.

    In this method, we'll maintain a dp[] array such that dp[i] contains the length of the longest increasing subsequence ending with arr[i].

    For every i from 0 to n-1, we'll find the longest increasing subsequence ending with arr[i] by checking all elements before i and keeping track of the maximum length.




### Code (C++)

```cpp
int longestSubsequence(int n, int a[])
{
    vector<int> dp(n, 1);
    for (int i = 1; i < n; i++) {
        for (int j = 0; j < i; j++) {
            if (a[i] > a[j]) {
                dp[i] = max(dp[i], dp[j] + 1);
            }
        }
    }
    return *max_element(dp.begin(), dp.end());
}

    
```

## Solution
Binary Search Approach :

    The Binary Search approach works in O(n log n) time. In this method, we'll maintain an array tail[] such that tail[i-1] stores the smallest possible tail element for all increasing subsequences of length i.




### Code (C++)

```cpp

int longestSubsequence(int n, int a[])
{
    vector<int> tail(n, 0);
    int length = 1; // length of longest increasing subsequence

    tail[0] = a[0];
    for (int i = 1; i < n; i++) {
        if (a[i] > tail[length-1])
            tail[length++] = a[i];
        else {
            auto it = lower_bound(tail.begin(), tail.begin()+length, a[i]);
            *it = a[i];
        }
    }

    return length;
}
    
```
Here, for each element in the input, if it is greater than the current longest subsequence's tail, it is appended in the tail, else it is used to replace the next greater element (found using binary search) in tail[]. The final length of tail[] is the length of the longest increasing subsequence.

## **Edit Distance**
Given two strings s and t. Return the minimum number of operations required to convert s to t.
The possible operations are permitted:

    Insert a character at any position of the string.
    Remove any character from the string.
    Replace any character from the string with any other character.

Input: 
s = "geek", t = "gesek"
Output: 1
Explanation: One operation is required 
inserting 's' between two 'e's of s.


## Solution
We will be using a 2D DP table where dp[i][j] represents the minimum number of operations to convert s up to i into t up to j.


### Code (C++)

```cpp
    int editDistance(string s, string t)
    {
        // get the length of the strings
        int n = s.length();
        int m = t.length();
        
        // create a DP table of size (n+1) x (m+1)
        vector<vector<int>> dp(n+1, vector<int>(m+1));
        
        // initialize the DP table
        for(int i=0; i<=n; i++)
        {
            for(int j=0; j<=m; j++)
            {
                
                // if string s is empty, insert all characters of t into s
                if(i==0) dp[i][j] = j;
                
                // if string t is empty, remove all characters of s
                else if(j==0) dp[i][j] = i;
                
                // if the last characters are same, get result for remaining strings
                else if(s[i-1] == t[j-1]) dp[i][j] = dp[i-1][j-1];
                
                // if the last characters are different, consider all operations
                else {
                    dp[i][j] = 1 + min({ dp[i][j-1],     // insert
                                        dp[i-1][j],     // remove
                                        dp[i-1][j-1] }); // replace
                }
            }
        }
        
        // return the final result
        return dp[n][m];
    }

```
In this code, we first initialize the DP table such that dp[i][0] = i and dp[0][j] = j. Then for each pair of characters in the two strings, we either get the result for the remaining strings if the characters are same, or consider all three operations and choose the one with minimum cost if the characters are different. The final result is dp[n][m].

## **Longest Path in a matrix**
Given a n*m matrix, find the maximum length path (starting from any cell) such that all cells along the path are in strictly increasing order.

We can move in 4 directions from a given cell (i, j), i.e., we can move to (i+1, j) or (i, j+1) or (i-1, j) or (i, j-1).
Input: matrix = {{1,2,9},{5,3,8},{4,6,7}}
Output: 7
Explanation: The longest increasing path is
{1,2,3,6,7,8,9}.

## Solution

 We will keep a memo table to store the length of longest path starting from each cell. If this value is already computed, we will return it instead of recomputing it.

### Code (C++)

```cpp
// Direction vectors
int dx[] = {0, 0, -1, 1};
int dy[] = {-1, 1, 0, 0};

// DFS function to compute the longest path
int dfs(vector<vector<int>>& matrix, int i, int j, vector<vector<int>>& dp) {
    // If this subproblem has already been solved, return the answer
    if(dp[i][j] != 0) return dp[i][j];
    
    int m = matrix.size(), n = matrix[0].size();
    // Check all 4 directions
    for(int k = 0; k < 4; k++) {
        int x = i + dx[k], y = j + dy[k];
        if(x >= 0 && x < m && y >= 0 && y < n && matrix[x][y] > matrix[i][j])
            dp[i][j] = max(dp[i][j], dfs(matrix, x, y, dp));
    }
    // Include the current cell in the path and return
    return ++dp[i][j];
}

int longestIncreasingPath(vector<vector<int>>& matrix) {
    if(matrix.empty()) return 0;
    int m = matrix.size(), n = matrix[0].size(), ans = 0;
    vector<vector<int>> dp(m, vector<int>(n, 0));
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            ans = max(ans, dfs(matrix, i, j, dp));
        }
    }
    return ans;
}

    
```
This code first initializes a DP table of the same size as the input matrix, with all elements set to 0. It then computes the longest increasing path starting from each cell using a DFS function, and stores the results in the DP table. The maximum value in the DP table is the length of the longest increasing path.

## **Optimal Strategy For A Game**

You are given an array A of size N. The array contains integers and is of even length. The elements of the array represent N coin of values V1, V2, ....Vn. You play against an opponent in an alternating way.

In each turn, a player selects either the first or last coin from the row, removes it from the row permanently, and receives the value of the coin.

You need to determine the maximum possible amount of money you can win if you go first.
Note: Both the players are playing optimally.

## Solution



### Code (C++)

```cpp
    long long maximumAmount(int arr[], int n)
    {

        vector<vector<long long>> dp(n, vector<long long>(n, 0));
    
        // Fill the dp table diagonally
        for (int gap = 0; gap < n; gap++)
        {
            for (int i = 0, j = gap; j < n; i++, j++)
            {
                // If only one element left, select it
                if (i == j)
                    dp[i][j] = arr[i];
                // If two elements left, select the maximum one
                else if (i + 1 == j)
                    dp[i][j] = max(arr[i], arr[j]);
                // If more than two elements left, select the maximum value after considering the opponent's move
                else
                {
                    dp[i][j] = max(arr[i] + min(dp[i + 2][j], dp[i + 1][j - 1]),
                                arr[j] + min(dp[i + 1][j - 1], dp[i][j - 2]));
                }
            }
        }
    
        return dp[0][n - 1];
    }
```
In the above code, we create a table dp where an entry dp[i][j] stores the maximum possible value that can be obtained by the player when coins from i to j are left in the game. The base cases are dp[i][j] = arr[i] when only one coin is left and dp[i][j] = max(arr[i], arr[j]) when only two coins are left. For other cases, we consider two scenarios: when the player picks the i'th coin or the j'th coin. In both cases, the opponent plays optimally and makes the player pick minimum of the values from the remaining coins.

## **0 - 1 Knapsack Problem**
You are given weights and values of N items, put these items in a knapsack of capacity W to get the maximum total value in the knapsack. Note that we have only one quantity of each item.
In other words, given two integer arrays val[0..N-1] and wt[0..N-1] which represent values and weights associated with N items respectively. Also given an integer W which represents knapsack capacity, find out the maximum value subset of val[] such that sum of the weights of this subset is smaller than or equal to W. You cannot break an item, either pick the complete item or dont pick it (0-1 property).


## Solution



### Code (C++)

```cpp
    int knapSack(int W, int wt[], int val[], int n) 
    { 
       // Declaring and Initialising the dp
       vector<vector<int>>dp(n+1,vector<int>(W+1,0));
       
       
       for(int i=1;i<=n;i++)
       {
           for(int j=1;j<=W;j++)
           {
               if(wt[i-1]<=j)
               {
                   dp[i][j] = max(dp[i-1][j],val[i-1]+dp[i-1][j-wt[i-1]]);
               }
               else
               {
                   dp[i][j] = dp[i-1][j];
               }
           }
       }
       return dp[n][W];
       
    }
    
```

## **Shortest Common Supersequence**
Given two strings X and Y of lengths m and n respectively, find the length of the smallest string which has both, X and Y as its sub-sequences.
Note: X and Y can have both uppercase and lowercase letters.

Example 1

Input:
X = abcd, Y = xycd
Output: 6
Explanation: Shortest Common Supersequence
would be abxycd which is of length 6 and
has both the strings as its subsequences.

Example 2

Input:
X = efgh, Y = jghi
Output: 6
Explanation: Shortest Common Supersequence
would be ejfghi which is of length 6 and
has both the strings as its subsequences.


## Solution

LCS variation.

### Code (C++)

```cpp
    int shortestCommonSupersequence(string X, string Y, int m, int n)
    {
        //code here
        
        return m+n-lcs(X, Y, m, n);
    }
    
    int lcs(string s1, string s2, int x, int y)
    {
        int dp[x+1][y+1]={{0}};
        for(int i=0;i<=x;i++)
        {
            dp[i][0]=0;
        }
        for(int j=0;j<=y;j++)
        {
            dp[0][j]=0;
        }
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

## ****



## Solution

This problem can be reduced to a subset sum problem. The task is to check if the sum of the array is even. If it's not, then it's not possible to divide the array into two partitions. If the sum is even, then check if there's a subset whose sum is sum/2. If such a subset exists, then we can say the array can be partitioned into two subsets of equal sum.

Here's a C++ function using dynamic programming to solve the problem:

### Code (C++)

```cpp
    int equalPartition(int N, int arr[])
    {
        // Calculate the total sum of the array.
        int sum = 0;
        for(int i = 0; i < N; i++)
        {
            sum += arr[i];
        }
        
        // If the sum is odd, return 0 because it's impossible to divide the array into two subsets of equal sum.
        if(sum % 2 != 0) return 0;
        
        sum /= 2;
        
        // Create a DP table, dp[i] will be true if there is a subset of arr[0..j] with sum equal to i.
        vector<bool> dp(sum+1, false);
        dp[0] = true; // There is always an empty set with sum 0
        
        // Fill dp table using a modified subset-sum problem approach.
        for(int i = 0; i < N; i++)
        {
            for(int j = sum; j >= arr[i]; j--)
            {
                if(dp[j - arr[i]])
                {
                    dp[j] = true;
                }
            }
        }
        
        // If sum/2 is achievable, return 1
        if(dp[sum]) return 1;
        
        return 0;
    
    }

```
This function calculates the total sum of the array, and checks if it's divisible by 2. If it's not, it returns 0 immediately, because it's impossible to partition the array into two subsets of equal sum. If the sum is even, it then checks if there's a subset whose sum is sum/2 by using a dynamic programming approach. The DP array dp[i] is true if there's a subset of arr[0..j] whose sum is i. The function finally returns whether dp[sum] is true.

## **Rod Cutting**
Given a rod of length N inches and an array of prices, price[]. price[i] denotes the value of a piece of length i. Determine the maximum value obtainable by cutting up the rod and selling the pieces.

Note: Consider 1-based indexing.

Example 1:

Input:
N = 8
Price[] = {1, 5, 8, 9, 10, 17, 17, 20}
Output:
22
Explanation:
The maximum obtainable value is 22 by 
cutting in two pieces of lengths 2 and 
6, i.e., 5+17=22.

## Solution
This problem is the variation of Unbounded Knapsack.


### Code (C++)

```cpp
int cutRod(int price[], int n)
    {
        // this problem is identical to un-bounded knapsack
        
        /* here we have to replace the weight array with length array
           value array with price array and weight limit with length
           
        */
        
        int length[n];
        for(int i=0;i<n;i++)
        {
            length[i]=(i+1);
        }
        
        int t[n+1][n+1];
        memset(t,0,sizeof(t));
        
        for(int i=1;i<=n;i++)
        {
            for(int j=1;j<=n;j++)
            {
                if(length[i-1]<=j)
                {
                    t[i][j]=max(t[i-1][j],t[i][j-length[i-1]]+price[i-1]);
                }
                else
                {
                    t[i][j]=t[i-1][j];
                }
            }
        }
        
        return t[n][n];
    }
    
```


## ** **



## Solution



### Code (C++)

```cpp

    
```


## **Coin Change**

Given an integer array coins[ ] of size N representing different denominations of currency and an integer sum, find the number of ways you can make sum by using different combinations from coins[ ].  
Note: Assume that you have an infinite supply of each type of coin. And you can use any coin as many times as you want.

Example 1:

Input:
N = 3, sum = 4
coins = {1,2,3}
Output: 4
Explanation: Four Possible ways are: {1,1,1,1},{1,1,2},{2,2},{1,3}.


## Solution
This problem can be solved using dynamic programming. The idea is to build a table dp where each entry dp[i][j] represents the number of ways to make sum j using the first i types of coins.

To fill the dp table, we have two choices for each coin at index i (0<=i<N):

    1. We do not use the ith coin: We can just ignore the coin and move on to the next coin, or in other words, we use the value of dp[i-1][j].
    2. We use the ith coin: We can use the ith coin and subtract the denomination of the ith coin from j. We then look up this new value in the dp table, dp[i][j-coins[i]].

Finally, the answer will be the last entry in the dp table, dp[N][sum].

Here's a C++ function to solve this problem:



### Code (C++)

```cpp
long long int count(int coins[], int N, int sum)
{
    // Initialize a dp table with size (N+1) x (sum+1)
    vector<vector<long long>> dp(N+1, vector<long long>(sum+1, 0));

    // When sum is 0, the answer is 1 for all i
    for (int i = 0; i <= N; i++)
    {
        dp[i][0] = 1;
    }

    // Fill the dp table
    for (int i = 1; i <= N; i++)
    {
        for (int j = 1; j <= sum; j++)
        {
            // If the coin value is greater than the current sum j, then we can't include the coin
            if (coins[i-1] > j)
                dp[i][j] = dp[i-1][j];
            else
                // Calculate the number of ways by excluding or including the ith coin
                dp[i][j] = dp[i-1][j] + dp[i][j-coins[i-1]];
        }
    }
    
    // Return the last entry of the dp table
    return dp[N][sum];
}

    
```



## **Word Break**

Given a string A and a dictionary of n words B, find out if A can be segmented into a space-separated sequence of dictionary words.

Note: From the dictionary B each word can be taken any number of times and in any order.
Example 1:

## Solution



### Code (C++)

```cpp
    /*Non DP approach*/
    unordered_map<string,int> m;
    
  bool solve(string s)
  {
     if(s.size()==0)
     {
        return 1;
     }
     
     for(int i=1;i<=s.size(); i++)
     {
          string temp = (s.substr(0,i));
          
          if(m[temp]>0 && solve(s.substr(i,s.size()-i+1)))
          {
              return 1;
          }else continue;
      }
      return 0;
  }
  
    int wordBreak(string A, vector<string> &B)
    {
         for(int i=0;i<B.size(); i++)
         {
          m[B[i]]++;
             
         }
    
      return solve(A);
    }
```


## Solution
DP approach
The idea is to process the given string from the left, one character at a time, while maintaining a boolean array dp[]. An entry dp[i] is true if a valid word (word is in dictionary) ends there. The optimization is to look for a sub-string ending at the current character and also a prefix substring appears in the dictionary.


### Code (C++)

```cpp
int wordBreak(string A, vector<string>& B) {
    int size = A.size();
    if(size == 0) return 1;

    // Create the DP table to store results of subproblems
    vector<bool> dp(size+1,false);
    
    // Insert all words of dictionary into a trie
    unordered_set<string> dict;
    for (int i = 0; i < B.size(); i++)
        dict.insert(B[i]);
    
    // iterate over the length of the string
    for(int i=1; i<=size; i++){
        // if dp[i] is false, then check if it can be segmented
        if (dp[i] == false && dict.find(A.substr(0, i)) != dict.end())
            dp[i] = true;
        
        // go to all indices reachable from current index
        if (dp[i] == true){
            if (i == size)
                return true;
            
            for(int a = i+1; a <= size; a++){
                if (dp[a] == false && dict.find(A.substr(i, a-i)) != dict.end())
                    dp[a] = true;
                
                if (a == size && dp[a] == true)
                    return true;
            }
        }
    }
    return false;
}

    
```
In this function, we first initialize a boolean dp[] array as false. We then iterate through the string and for every ending position, we check whether a word ends at this position. If we get a prefix that is present in the dictionary, we update the dp value for this position and move forward.

Finally, we return dp[n] (n is the length of the input string) which indicates whether the input string can be segmented or not.


## **Dice throw**

Given N dice each with M faces, numbered from 1 to M, find the number of ways to get sum X. X is the summation of values on each face when all the dice are thrown.

 

Example 1:

Input:
M = 6, N = 3, X = 12
Output:
25
Explanation:
There are 25 total ways to get
the Sum 12 using 3 dices with
faces from 1 to 6.

## Solution
The main idea here is to maintain a table dp[i][j] where dp[i][j] represents the number of ways to generate a sum of j using i dices.

To fill up the table, for each dice (from 1 to N), for each possible sum (from 1 to X), we add the number of ways to generate (current sum - face value) using one less dice.

Here is the C++ code:


### Code (C++)

```cpp
    long long noOfWays(int M , int N , int X)
    {
        // Initializing the dp table
        vector<vector<long long>> dp(N+1, vector<long long>(X+1, 0));
        
        // If X is less than the number of dices, return 0
        if(X < N || X > N*M) return 0;
        
        // There is 1 way to get sum between 1 to M with 1 dice
        for(int j=1; j<=M && j<=X; j++)
            dp[1][j] = 1;
            
        // Fill rest of the entries in dp[][]
        // i: number of dices, j: sum
        for(int i=2; i<=N; i++)
        {
            for(int j=1; j<=X; j++)
            {
                for(int k=1; k<=M && k<j; k++)
                {
                    dp[i][j] += dp[i-1][j-k];
                }
            }
        }
        
        // Return number of ways to get sum X using N dices
        return dp[N][X];
    }
```
This code initializes a dynamic programming table dp[N+1][X+1] where dp[i][j] represents the number of ways to make sum j using i dices. It then fills this table by considering all dices and sums smaller than the given sum. Finally, it returns the entry dp[N][X] which represents the number of ways to get sum X using N dices.

## **Egg Dropping Puzzle**
You are given N identical eggs and you have access to a K-floored building from 1 to K.

There exists a floor f where 0 <= f <= K such that any egg dropped at a floor higher than f will break, and any egg dropped at or below floor f will not break. There are few rules given below. 

    An egg that survives a fall can be used again.
    A broken egg must be discarded.
    The effect of a fall is the same for all eggs.
    If the egg doesn't break at a certain floor, it will not break at any floor below.
    If the eggs breaks at a certain floor, it will break at any floor above.

Return the minimum number of moves that you need to determine with certainty what the value of f is.

For more description on this problem see wiki page



## Solution
The approach is as follows:

    1. If we have only one egg, then we must try every floor one by one, starting from the first. Therefore, the worst case number of trials will be k (the number of floors).

    2. If we have more than one egg, then we can use a binary approach. We drop an egg from a certain floor:

    a. If it breaks, we know that the critical floor is below us, so we can ignore the floors above.

    b. If it does not break, we know that the critical floor is above us, so we can ignore the floors below.

However, we don't know the exact floor from which to drop the egg to minimize the number of attempts. Hence, we must try dropping from each floor and calculate the worst case number of attempts, and finally, choose the floor which minimizes the worst case number of attempts.


### Code (C++)

```cpp
int eggDrop(int n, int k)
{
    vector<vector<int>> dp(n+1, vector<int>(k+1, 0));

    // Base cases:
    // 1. If there is one floor, one trial is needed.
    // 2. If there are 0 floors, no trials are needed.
    // 3. If there is one egg, k trials are needed.
    for(int i=1; i<=n; i++)
    {
        dp[i][1] = 1;
        dp[i][0] = 0;
    }
    for(int j=1; j<=k; j++)
        dp[1][j] = j;

    // Fill the rest of the entries in table dp[][]
    // using optimal substructure property
    for(int i=2; i<=n; i++)
    {
        for(int j=2; j<=k; j++)
        {
            dp[i][j] = INT_MAX;
            for(int x=1; x<=j; x++)
            {
                int res = 1 + max(dp[i-1][x-1], dp[i][j-x]);
                if(res < dp[i][j])
                    dp[i][j] = res;
            }
        }
    }

    // Return the minimum number of trials needed for n eggs and k floors
    return dp[n][k];
}

    
```
This code fills up a 2D table dp where dp[i][j] will represent the minimum number of trials needed for i eggs and j floors. The worst-case number of trials needed for j floors and i eggs can be calculated using the optimal substructure property of the problem. The optimal solution for dp[i][j] will be 1 plus the maximum of dp[i-1][x-1] and dp[i][j-x] where x in this case is the floor at which we drop the egg. We loop over all possible x to find the minimum for dp[i][j]. Finally, dp[n][k] will give us the minimum number of trials needed for n eggs and k floors.

## **Max length chain**
You are given N pairs of numbers. In every pair, the first number is always smaller than the second number. A pair (c, d) can follow another pair (a, b) if b < c. Chain of pairs can be formed in this fashion. You have to find the longest chain which can be formed from the given set of pairs. 
 Input:
N = 5
P[] = {5  24 , 39 60 , 15 28 , 27 40 , 50 90}
Output: 3
Explanation: The given pairs are { {5, 24}, {39, 60},
{15, 28}, {27, 40}, {50, 90} },the longest chain that
can be formed is of length 3, and the chain is
{{5, 24}, {27, 40}, {50, 90}}


## Solution



### Code (C++)

```cpp
/*Non-DP Solution*/

    struct val
    {
        int first;
        int second;
    };

    static bool compare(struct val a,struct val b)
    {
        return a.second<b.second;
    }

    int maxChainLen(struct val p[],int n)
    {
        sort(p,p+n,compare);
        int l=1,prev=p[0].second;
        for(int i=1;i<n;i++)
        {
            if(p[i].first>prev)
            {
                prev=p[i].second; l++;
            }
        }
        return l;
    }
    
```


## ** **



## Solution

At each turn, a player will choose the optimal strategy to maximize his score. The strategy will be to choose the maximum value from the front or back of the array. So, we keep track of the score difference between the two players.

If the final score difference is greater than or equal to zero, then player 1 wins.

Approach:

    1. We maintain a 2D table dp[i][j], where i and j are the starting and ending indices of the current subarray (i.e., the remaining elements in the array).

    2. dp[i][j] stores the maximum score difference that player 1 can achieve over player 2 when only the subarray from index i to j is remaining.

    3. For each subarray, player 1 has two choices, either to choose the element at the beginning or the end.

        a.  If he chooses the beginning element (arr[i]), then player 2 will be the first player for the remaining subarray [i+1, j]. So, the score difference will be arr[i] - dp[i+1][j].

        b. If he chooses the end element (arr[j]), then player 2 will be the first player for the remaining subarray [i, j-1]. So, the score difference will be arr[j] - dp[i][j-1].

    4. Since player 1 wants to maximize his score difference, dp[i][j] will be the maximum of the two choices.



### Code (C++)

```cpp

bool is1winner(int N,int arr[])
{
    vector<vector<int>> dp(N, vector<int>(N));
    for (int gap = 0; gap < N; ++gap)
    {
        for (int i = 0, j = gap; j < N; ++i, ++j)
        {
            int x = ((i+2) <= j) ? dp[i+2][j] : 0;
            int y = ((i+1) <= (j-1)) ? dp[i+1][j-1] : 0;
            int z = (i <= (j-2)) ? dp[i][j-2] : 0;
            dp[i][j] = max(arr[i] + min(x, y), arr[j] + min(y, z));
        }
    }
    int diff = dp[0][N-1];
    return (diff >= 0);
}

    
```

## **Nth Fibonacci Numbe**

Given a positive integer n, find the nth fibonacci number. Since the answer can be very large, return the answer modulo 1000000007.(10e9+7)

## Solution



### Code (C++)

```cpp
    int nthFibonacci(int n)
    {
        int dp[n+1];
        dp[0] = 0;
        dp[1] = 1;
        
        for(int i=2;i<=n;i++){
            dp[i] = (dp[i-1] + dp[i-2]) % 1000000007;
        }
        return dp[n];
    }
```


## **Matrix Chain Multiplication**
Given a sequence of matrices, find the most efficient way to multiply these matrices together. The efficient way is the one that involves the least number of multiplications.

The dimensions of the matrices are given in an array arr[] of size N (such that N = number of matrices + 1) where the ith matrix has the dimensions (arr[i-1] x arr[i]).

## Solution

In the Matrix Chain Multiplication problem, we are given a sequence of matrices and we need to figure out the most efficient way to multiply these matrices together. The problem is not actually to perform the multiplications, but merely to decide in which order to perform the multiplications.

This is a dynamic programming problem, and we can solve it by breaking it into sub-problems.

Let's define a 2D table dp[i][j] to represent the minimum number of scalar multiplications needed to compute the matrix Ai...Aj, where the dimension of Ai is arr[i-1] x arr[i].

Then we can iterate over all pairs (i, j) such that j > i, and for each pair we iterate over all possible splits k such that i < k < j, and we update dp[i][j] with the minimum cost of dp[i][k] + dp[k][j] + arr[i-1]*arr[k]*arr[j].

Here is the C++ code implementing this:

### Code (C++)

```cpp
int matrixMultiplication(int N, int arr[])
{
    int dp[N][N];
    for(int i=0; i<N; i++)
        dp[i][i] = 0;  // cost is zero when multiplying one matrix.
    for(int L=2; L<N; L++)  // L is the chain length
    {
        for(int i=1; i<N-L+1; i++)
        {
            int j = i+L-1;
            dp[i][j] = INT_MAX;
            for(int k=i; k<=j-1; k++)
            {
                int q = dp[i][k] + dp[k+1][j] + arr[i-1]*arr[k]*arr[j];
                if(q < dp[i][j])
                    dp[i][j] = q;
            }
        }
    }
    return dp[1][N-1];
}

    
```
This code will return the minimum number of multiplications needed to multiply all the matrices together in the most efficient order. The time complexity of this solution is O(n^3), and it uses O(n^2) extra space to store the DP table.


## **Unique BST'**

Given an integer. Find how many structurally unique binary search trees are there that stores the values from 1 to that integer (inclusive). 

## Solution

We are just calculating nth catalian number.

### Code (C++)

```cpp
    int numTrees(int N) 
    {
        
        vector<long long int> dp(N + 1, 0);
        dp[0] = 1;
        dp[1] = 1;
    
        for (int i = 2; i <= N; ++i)
        {
            for (int j = 0; j < i; ++j)
            {
                dp[i] = (dp[i]+ ((dp[j]%MOD)*(dp[i - j - 1]%MOD))%MOD)%MOD;
            }
        }
    
        return dp[N]%MOD;
    }
    
```


