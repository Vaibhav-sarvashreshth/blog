---
title: CSES Graph Questions
date: 2023-07-25T15:10:44+05:30
draft: false
---

## List Of Questions:

1. [Counting Rooms](#counting-rooms)




## [Counting Rooms](https://cses.fi/problemset/task/1192)

## Solution

    Since we're looking for the shortest path from start to end, it's a good idea to use Breadth-first Search (BFS). Start at the position A, and expand in all possible directions (up, down, left, right), but only if the destination cell is accessible (not a wall) and unvisited.

    While doing BFS, maintain a parent map to keep track of the cell from where we reached the current cell. This will help in backtracking to get the path once we reach the end position B.

    Once we reach B, we know that BFS gives us the shortest path in an unweighted graph. So, start from B and move towards A using the parent map, and keep storing the direction of movement. This will give us the shortest path.

    If we can't reach B, print "NO".

## Code in C++

```cpp
#include <bits/stdc++.h>
using namespace std;
 
#pragma GCC optimize("O3")
#define ll long long
#define vl vector<ll>
#define endl "\n"
#define tt ll t; cin>>t; while(t--)
#define mp make_pair
#define pb push_back
#define pf push_front
#define ppb pop_back
#define ppf pop_front
#define fast_io ios::sync_with_stdio(false); cin.tie(0); cout.tie(0)
#define fo(a,b) for(int i=a;i<b;i++)
#define mem1(a) memset(a,-1,sizeof(a))
#define mem0(a) memset(a,-1,sizeof(a))
#define lcm(a,b) (a/__gcd(a,b))*b
 
//inline ll gcd(ll a, ll b) { return b == 0 ? a : gcd(b, a % b);}
//inline ll lcm(ll a, ll b) { return a * b / gcd(a, b);}
 
const int N = 1e3 + 5;
int dx[4] = { -1, 1, 0, 0};
int dy[4] = {0, 0, -1, 1};
int kx[8] = { -1, 1, 0, 0, -1, -1, 1, 1};
int ky[8] = {0, 0, -1, 1, -1, 1, -1, 1};
 
int n, m;
int vis[N][N];
bool val(int r, int c)
{
	if(r<0 || r>=n || c<0 || c>=m)
	{
		return 0;
	}
	return 1;
}
void dfs(int r, int c)
{
	
	vis[r][c]=1;
	
	for(int i=0;i<4;i++)
	{
		int nr = dx[i]+r;
		int nc = dy[i]+c;
		
		if(val(nr,nc) && vis[nr][nc]==0)
		{
			dfs(nr,nc);
		}
	}
}
 
void solve()
{
	cin>>n>>m;
	
	for(int i=0;i<n;i++)
	{
		string s;
		cin>>s;
		for(int j=0;j<m;j++)
		{
			char c=s[j];
			if(c=='#')
			{
				vis[i][j]=1;
				
			}
			else
			{
				vis[i][j]=0;
			}
		}
		
	}
	int c =0;
	
	for(int i=0;i<n;i++)
	{
		for(int j=0;j<m;j++)
		{
			if(vis[i][j]==0)
			{
				c++;
				dfs(i,j);
			}
			
		}
	}
	cout<< c<<endl;
 
	
}	
int main()
{
	
	fast_io;
	solve();
	return 0;
}
```





