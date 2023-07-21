---
title: Top 50 Graph Questions
date: 2023-07-20T15:10:44+05:30
draft: false
tags: [top-50-graph-question, Imp-graph_questions, DFS, BFS]
---

# Top 50 Graph Problems

Looking to master graph theory and solve graph problems efficiently? You're in the right place! This blog provides solutions to the top 50 graph problems along with multiple approaches for each problem. We also ensure that the written code is well-commented for better understanding.

Graphs are essential data structures used in various fields, including computer science, data analysis, and network analysis. By gaining proficiency in graph theory and problem-solving, you can enhance your skills and tackle complex challenges effectively.

# Graph Problem Heading

## **Print adjacency list**

Given the adjacency list of a bidirectional graph. Your task is to copy/clone the adjacency list for each vertex and return a new list.

## Solution

Discuss the first solution to the graph problem. Explain the approach, algorithm, or technique used in this solution. Provide step-by-step explanations, highlighting any key insights or observations.

### Code (C++)

```cpp
vector<vector<int>> printGraph(int V, vector<int> adj[])
    {

        vector<vector<int>> graph(V);
        int k=0;
        while(k<V)
        {
            graph[k].push_back(k);
            k++;
        }
        for(int i=0;i<V;i++)
        {

            for(int x : adj[i])
            {
                graph[i].push_back(x);
            }
        }
        return graph;
    }
```

## **BFS of graph**

Given a directed graph. The task is to do Breadth First Traversal of this graph starting from 0.

`Note`: One can move from node u to node v only if there's an edge from u to v and find the BFS traversal of the graph starting from the 0th vertex, from left to right according to the graph. Also, you should only take nodes directly or indirectly connected from Node 0 in consideration.

### Solution

```cpp
vector<int> bfsOfGraph(int V, vector<int> adj[])
    {
        // Vector to store the nodes visited in BFS order
        vector<int> nodes;

        // Array to keep track of visited nodes
        int visited[V] = {false};

        // Create a queue for BFS traversal
        queue<int> q;

        // Start BFS from vertex 0
        q.push(0);
        visited[0] = true;


        // Perform BFS traversal
        while (!q.empty())
        {
            int front = q.front();
            nodes.push_back(front);
            q.pop();

            // Traverse all adjacent nodes of the current node
            for (auto node : adj[front])
            {
                // If the adjacent node is not visited, mark it as visited,
                // add it to the visited nodes vector, and enqueue it for further traversal
                if (!visited[node])
                {
                    visited[node] = true;
                    q.push(node);
                }
            }
        }

        // Return the vector containing the nodes visited in BFS order
        return nodes;

    }
```

## **DFS of Graph**

You are given a connected undirected graph. Perform a Depth First Traversal of the graph.
Note: Use a recursive approach to find the DFS traversal of the graph starting from the 0th vertex from left to right according to the graph.

### Solution

```cpp
/*
 * Depth First Traversal (DFS) of a Graph
 *
 * This code implements a recursive approach to perform a Depth First Traversal (DFS) of a connected undirected graph.
 * The DFS traversal starts from the 0th vertex and explores all reachable vertices from each visited vertex.
 * The traversal order is from left to right according to the graph.
 */

void dfs(vector<int> adj[],int i,vector<bool>&visited,vector<int>&ans)
    {
        
            visited[i]=true;
            ans.push_back(i);
            for(int vertex : adj[i])
            {
                if(!visited[vertex])
                {
                    dfs(adj,vertex,visited,ans);
                }
                
            }
        
    }
    
    vector<int> dfsOfGraph(int V, vector<int> adj[])
    {
        vector<int> ans;
        vector<bool> visited(V,false);
        
        
        for(int i=0;i<V;i++)
        {
            if(!visited[i])
            {
                dfs(adj,i,visited,ans);
            }
        }
        return ans;
    }

```

## **Find the number of islands**

Given a grid of size n*m (n is the number of rows and m is the number of columns in the grid) consisting of '0's (Water) and '1's(Land). Find the number of islands.

Note: An island is either surrounded by water or boundary of grid and is formed by connecting adjacent lands horizontally or vertically or diagonally i.e., in all 8 directions.


### **Solution (using BFS)**

```cpp
#include <vector>
#include <queue>
using namespace std;

// Breadth-First Search (BFS) function
void bfs(vector<vector<int>>& adj, int V, int N, bool* visited) {
queue<int> q;
visited[N] = true;
q.push(N);


while (!q.empty()) {
    int top = q.front();
    q.pop();
    for (int i = 0; i < V; i++) {
        if (!visited[i] && adj[top][i]) {
            q.push(i);
            visited[i] = true;
        }
    }
}

}

// Function to find the number of provinces in the graph
int numProvinces(vector<vector<int>>& adj, int V) {
bool visited[V] = { false };
int no_of_provinces = 0;



for (int i = 0; i < V; i++) {
    if (!visited[i]) {
        bfs(adj, V, i, visited);
        no_of_provinces++;
    }
}

return no_of_provinces;

}
```
### **Solution (using DFS)**

```cpp

void dfs(int index, vector<vector<int>> adj, int visited[], int V)
    {
        visited[index] = 1;
        
        for(int i = 0; i < V; i++)
        {
            if(adj[index][i] and visited[i] == 0)
            {
                visited[i] = 1;
                dfs(i, adj, visited, V);
            }
        }
    }
    
    int numProvinces(vector<vector<int>> adj, int V) {
        
        int visited[V] = {0};
        int comp = 0;
        
        for(int i = 0; i < V; i++)
        {
            if(!visited[i])
            {
                comp++;
                dfs(i, adj, visited, V);
            }
        }
        
        return comp;
    }


```

## **Find the number of islands**

Given a grid of size n*m (n is the number of rows and m is the number of columns in the grid) consisting of '0's (Water) and '1's(Land). Find the number of islands.

Note: An island is either surrounded by water or boundary of grid and is formed by connecting adjacent lands horizontally or vertically or diagonally i.e., in all 8 directions.




### **Solution**

```cpp

int vis[501][501]={{0}};
    int n,m;
    int dx[8] = { -1, 1, 0, 0, -1, -1, 1, 1};
    int dy[8] = {0, 0, -1, 1, -1, 1, -1, 1};
    
    bool val(int r,int c)
    {
        if(r<0 || r>=n || c<0 || c>=m)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }
    
    void dfs(int r,int c)
    {
        vis[r][c]=1;
        for(int i=0;i<8;i++)
        {
            int nr=r+dx[i];
            int nc=c+dy[i];
            if(val(nr,nc) && vis[nr][nc]==0)
            {
                dfs(nr,nc);
                
            }
        }
    }
    
    int numIslands(vector<vector<char>>& grid)
    {
        // Code here
        n=grid.size();
        m=grid[0].size();
        
        int no_of_island=0;
        
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<m;j++)
            {
                if(grid[i][j]=='0')
                {
                    vis[i][j]=1;
                }
            }
        }
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<m;j++)
            {
                if(!vis[i][j])
                {
                    dfs(i,j);
                    no_of_island++;
                }   
            }
        }
        return no_of_island;
        
    }


```

## **Detect cycle in an undirected graph**

Given an undirected graph with V vertices and E edges, check whether it contains any cycle or not. Graph is in the form of adjacency list where adj[i] contains all the nodes ith node is having edge with.


### **Solution**

```cpp
#include <vector>
using namespace std;

// Depth-First Search (DFS) function
bool dfs(vector<int> adj[], vector<bool>& visited, int source, int parent) {
visited[source] = true;



for (auto node : adj[source]) {
    if (visited[node] == false) {
        if (dfs(adj, visited, node, source)) {
            return true;
        }
    } else if (node != parent) {
        return true;
    }
}

return false;

}

// Function to check whether the graph contains any cycle
bool isCycle(int V, vector<int> adj[]) {
vector<bool> visited(V, false);



for (int i = 0; i < V; i++) {
    if (visited[i] == false) {
        if (dfs(adj, visited, i, -1)) {
            return true;
        }
    }
}

return false;

}

```


## **Hamiltonian Path**

A Hamiltonian path, is a path in an undirected graph that visits each vertex exactly once. Given an undirected graph, the task is to check if a Hamiltonian path is present in it or not.


### **Solution**

```cpp
 bool dfs(int n, vector<int> adj[], vector<int> &vist, int src){
        if(n==0){
            return true;
        }
        vist[src]=1;
        for(auto &x:adj[src]){
            if(vist[x]==0){
                if(dfs(n-1,adj,vist,x)){
                    return true;
                }
            }
        }
        vist[src]=0;
        return false;
    }
    bool check(int N,int M,vector<vector<int>> Edges)
    {
        // code here
        int n= N, m= M;
        vector<int> adj[n];
        
        for(auto &x:Edges){
            adj[x[0]-1].push_back(x[1]-1);
            adj[x[1]-1].push_back(x[0]-1);
        }
        
        vector<int> vist(n,0);
        
        for(int i=0;i<n;i++){
            if(dfs(n-1,adj,vist,i)){
                return true;
            }
        }
        return false;
    }
```

## **Prerequisite Tasks**

There are a total of N tasks, labeled from 0 to N-1. Some tasks may have prerequisites, for example to do task 0 you have to first complete task 1, which is expressed as a pair: [0, 1]
Given the total number of tasks N and a list of prerequisite pairs P, find if it is possible to finish all tasks.


### **Solution**

```cpp
bool isPossible(int N, vector<pair<int, int> >& prerequisites) {
	    // Code here
	    
	    int n = N;
	    
	    vector<vector<int>> graph(n);
        vector<int> indegree(n,0);
        for(auto c : prerequisites)
        {
            graph[c.second].push_back(c.first);
            indegree[c.first]++;
        }
        
        vector<int> toposort;
        queue<int> q;
        for(int i=0;i<n;i++)
        {
            if(indegree[i]==0) 
                q.push(i);
        }
        while(!q.empty())
        {
            int curr = q.front();
            q.pop();
            toposort.push_back(curr);
            
            for(auto nbr: graph[curr])
            {
                indegree[nbr]--;
                if(indegree[nbr]==0) 
                    q.push(nbr);
            }
        }
        if(toposort.size()!=n) 
        	return false;
        	
        return true;
	}
```


## **Course Schedule**
There are a total of n tasks you have to pick, labeled from 0 to n-1. Some tasks may have prerequisites tasks, for example to pick task 0 you have to first finish tasks 1, which is expressed as a pair: [0, 1]
Given the total number of n tasks and a list of prerequisite pairs of size m. Find a ordering of tasks you should pick to finish all tasks.
Note: There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all tasks, return an empty array. Returning any correct order will give the output as 1, whereas any invalid order will give the output "No Ordering Possible".



### **Solution (Using Kosarajus Algorithm)**

```cpp
bool dfs(int i ,vector<vector<int>> &adj,vector<int> &visited , vector<int> &recursive_stack ,stack<int>&answer)
    {
         recursive_stack[i]= true;
         visited[i]=true;
         
        for(auto node: adj[i])
        {
            
            if(!visited[node])
            {
                if(dfs(node,adj,visited,recursive_stack,answer))
                {
                    return true;
                }
                
            }
            else if(recursive_stack[node]==true)
            {
                return true;
            }
            
            
        }
        answer.push(i);
        recursive_stack[i]= false;
        
        return false;
    }
        
    vector<int> findOrder(int n, int m, vector<vector<int>> prerequisites) 
    {
        //code here
        vector<int>ordering;
        vector<int>visited(n,0),recursive_stack(n,0);
	    
	    vector<vector<int>> adj(n);
	    stack<int>answer;
	    
	    // converting the list into adj matrix
	     for (auto& prerequisite : prerequisites) {
            int course = prerequisite[0];
            int prerequisiteCourse = prerequisite[1];
            adj[prerequisiteCourse].push_back(course);
        }
	    
	    
	    // now traversing through adj using dfs
	    
	    for(int i=0;i<n;i++)
	    {
	        if(!visited[i])
	        {
	            if(dfs(i,adj,visited,recursive_stack,answer))
	            {
	                
	                return {};
	            }
	        }
	    }
	    
	    while (!answer.empty()) {
            ordering.push_back(answer.top());
            answer.pop();
        }

        return ordering;
        
        
        
    }
```

## **Solution (Using Kahn’s algorithm for Topological Sorting)**

```cpp
vector<int> findOrder(int n, int m, vector<vector<int>> prerequisites) 
    {
        
        
        /* Here I used Kahns algorithm, first will find the inorder of all nodes, if we found
        inorder=0 for a node, then we will push it in a queue, to traverse the graph like we did in BFS.
        Then through that node we will travserv the other nodes, decrementing their indegrees.
        */
        vector<vector<int>>graph(n);
        vector<int>indegree(n,0);
        queue<int>q;
        vector<int>toposort;
        
        for(int i=0;i<m;i++)
        {
            graph[prerequisites[i][1]].push_back(prerequisites[i][0]);
            indegree[prerequisites[i][0]]++;
        }
        
        for(int i=0;i<n;i++)
        {
            if(indegree[i]==0)
            {
                q.push(i);
                toposort.push_back(i);
            }
        }
        
        while(!q.empty())
        {
            int front = q.front();
            q.pop();
            for(auto node : graph[front])
            {
                indegree[node]--;
                if(indegree[node]==0)
                {
                    q.push(node);
                    toposort.push_back(node);
                }
            }
        }
        if(toposort.size() != n)
        {
            return vector<int>();
        }
        return toposort;
        
    }
```


## **Circle of strings**
Given an array of lowercase strings A[] of size N, determine if the strings can be chained together to form a circle.
A string X can be chained together with another string Y if the last character of X is same as first
character of Y. If every string of the array can be chained, it will form a circle.

For example, for the array arr[] = {"for", "geek", "rig", "kaf"} the answer will be Yes as the given strings can be chained as "for", "rig", "geek" and "kaf"



### **Solution**

```cpp
    void dfs(int node, vector<int> adj[], vector<int> &vis)
    {
        vis[node]=1;
        
        for(auto child: adj[node])
        {
            if(vis[child]==0)
            {
                dfs(child,adj,vis);
            }
        }

    }

    int isCircle(int N, vector<string> A)
    {
        int n= N;
        vector<int> adj[26];
        vector<int> in(26,0), out(26,0);
        
        for(int i=0;i<n;i++)
        {
            int ch1=A[i][0]-'a';
            int ch2=A[i].back()-'a';
            
            adj[ch1].push_back(ch2); //linking all componenets to form a eulerian cycle and test later

            // so here we are linking the first character and the last character of a string together

            in[ch2]++;
            out[ch1]++;
        }
        
        vector<int> vis(26,0); 
        int src=0;
        
        
        for(int i=0;i<26;i++)
        {
            if(in[i]!=out[i])
            {
                return 0;
            }
        }

        for(int i=0;i<26;i++)
        {
            if(out[i]!=0)
            {
                src=i;
                break;
            }
        }
        
        dfs(src,adj,vis);
        
        for(int i=0;i<26;i++)
        {
            if(vis[i]==0 && out[i])
            {
                return 0;
            }
        }
        
        return 1;
    }

```




## **Bipartite Graph**
Given an adjacency list of a graph adj  of V no. of vertices having 0 based index. Check whether the graph is bipartite or not.



### **Solution**

```cpp

    bool isBipartite(int V, vector<int>adj[])
	{
        /*This code works on a simple principle that, while traversing the graph, you first color the first node and then you color all its neighbour with alternate color, and you keep on repeating the process. While doing so, if you found any node which is already colored and has the same color as the parent node, then its not the bi-partite graph. Else it is. */

        // this code works for disconnected as well as connected graph

        // consider red as 0 and blue as 1

	    vector<int>color(V,-1);
	    queue<pair<int,int>>q; // first -> node, second -> color
	    
	    for(int i=0;i<V;i++)
	    {
	        if(color[i]==-1)
	        {
	            color[i]=0;
	            q.push({i,0});
	            while(!q.empty())
    	        {
    	            
    	            pair<int,int> front = q.front();
        	        q.pop();
        	        int node = front.first;
        	        int col = front.second;
        	        
        	        for(int neighbour : adj[node])
        	        {
        	            if(color[neighbour] == col)
        	            {
        	                return 0;
        	            }
        	            else if(color[neighbour]==-1)
        	            {
        	                color[neighbour] = (col)?(0):(1);
        	                q.push({neighbour,color[neighbour]});
        	            }
        	        }
    	            
    	        }
	            
	        }
	        
	    }
	    
	    return 1;
	}

```
## **Detect cycle in a directed graph**
Given a Directed Graph with V vertices (Numbered from 0 to V-1) and E edges, check whether it contains any cycle or not.



### **Solution**
```cpp
    bool dfs(int i ,vector<int> adj[],vector<int> &visited , vector<int> &recursive_stack )
    {
         recursive_stack[i]= true;
         visited[i]=true;

        for(auto node: adj[i])
        {
            if(!visited[node])
            {
                if(dfs(node,adj,visited,recursive_stack))
                {
                    return true;
                }
                
            }
            else if(recursive_stack[node]==true) // that means if it is visited and also present in a recursive stack , which means cycle is present 
            {
                return true;
            }

        }
        
        recursive_stack[i]= false;
        return false;
    }

    bool isCyclic(int V, vector<int> adj[])
    {
        
        vector<int>visited(V,0),recursive_stack(V,0);
        
        for(int i=0;i<V;i++)
        {
            for(auto node : adj[i])
            {
                if(!visited[i])
                {
                    // note that dfs function here returns true if cycle is present and returns false when cycle is not present
                    if(dfs(i,adj,visited,recursive_stack))
                    {
                        return true;
                    }
                }
            }
        }
        
        return false;
        
    }
```

## **Find whether path exist**
Given a grid of size n*n filled with 0, 1, 2, 3. Check whether there is a path possible from the source to destination. You can traverse up, down, right and left.
The description of cells is as follows:

A value of cell 1 means Source. \
A value of cell 2 means Destination.\
A value of cell 3 means Blank cell.\
A value of cell 0 means Wall.

Note: There are only a single source and a single destination.



### **Solution Using BFS**

```cpp
    int dx[4] = { -1, 1, 0, 0};
    int dy[4] = {0, 0, -1, 1};
    bool val(int x,int y,int n)
    {
        if(x<0 || y<0 || x>=n || y>=n)
        {
            return 0;
        }
        return 1;
    }
    
    
    bool is_Possible(vector<vector<int>>& grid) 
    {
        //code here
        int n=grid.size();
        queue<pair<int,int>>q;
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<n;j++)
            {
                if(grid[i][j]==1)
                {
                    q.push({i,j});
                    grid[i][j]=0;
                    break;
                }
            }
        }
        while(!q.empty())
        {
            int x=q.front().first;
            int y=q.front().second;
            q.pop();
            for(int i=0;i<4;i++)
            {
                int nx=x+dx[i];
                int ny=y+dy[i];
                if(val(nx,ny,n)==1 && grid[nx][ny]!=0)
                {
                    
                    if(grid[nx][ny]==2)
                    {
                        return 1;
                    }

                    //here just aking sure that, we do not visit the same vertex twice, so making 3 to 0

                    grid[nx][ny]=0;
                    q.push({nx,ny});
                }
            }
            
        }
        return 0;
        
    }
```

### **Solution Using DFS**
```cpp
bool dfs(int x, int y, vector<vector<int>>& v)
    {
        if(x<0 || x>=v.size() || y<0 || y>=v.size() || v[x][y]==0) return false;
        if(v[x][y]==2) return true;
        v[x][y] = 0;
        
        bool ans = dfs(x+1,y,v) || dfs(x-1,y,v) || dfs(x,y+1,v) || dfs(x,y-1,v);
        return ans;
    }
    
    bool is_Possible(vector<vector<int>>& v) 
    {
        int n = v.size();
        queue<pair<int,int>> q;
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<n;j++)
            {
                if(v[i][j]==1)
                {
                    if(dfs(i,j,v)) return true;
                    else return false;
                }
            }
        }
    }
```

## **Topological sort**

Given a Directed Acyclic Graph (DAG) with V vertices and E edges, Find any Topological Sorting of that Graph.




### **Solution BFS (Kahn's Algo)**

BFS Approach || Kahn's Algo
Idea

The idea is that all nodes which will be at starting will have indegree 0. 

`Algorithm`

Store Indegree of all nodes in Array.\
Push nodes in Queue whose indegree == 0.\
Now, For each node in Queue.\
Pop the current node & Store into resultant Array\
Remove indegree count of all neighbours of current node.\
If neighbours indegree becomes 0 the push into queue.\
Finally, return resultant Array.


```cpp
    vector<int> topoSort(int V, vector<int> adj[])
    {
	    vector<int> res;
	    vector<int> indegree(V, 0);
	    
	    for(int i = 0; i < V; i++)
        {
	        for(int nbr : adj[i])
            {
	            indegree[nbr]++;
	        }
	    }
	    
	    queue<int> q;
	    for(int i = 0; i < V; i++)
        {
	        if(indegree[i] == 0)
            {
	            q.push(i);
	        }
	    }
	    
	    while(!q.empty())
        {
	        int curr = q.front(); q.pop();
	        res.push_back(curr);
	        
	        for(int nbr : adj[curr])
            {
	            indegree[nbr]--;
	            if(indegree[nbr] == 0) q.push(nbr);
	        }
	    }
	    
	    return res;
	}

```

### **Solution DFS Approach**
`Idea`

Node that comes at last must be present at last. Hence, the idea is to store last visited at bottom. Thus, Stack comes into picture.

`Algorithm`

Make visited Array to tackle both disconnected & visited Nodes.
Call DFS on each unvisited node
Call DFS on unvisited Neighbours
After making all calls to Neighbours Store current Node in a Stack.
Finally, pop all the elements of stack into resultant Vector

```cpp
    void dfs(int start, vector<bool> &vis, stack<int> &s, vector<int> adj[])
    {
	    vis[start] = 1;
	    
	    for(int nbr : adj[start])
        {
	        if(!vis[nbr])
            {
	            dfs(nbr, vis, s, adj);
	        }
	    }
	    
	    s.push(start);
	}
	
	vector<int> topoSort(int V, vector<int> adj[])
    {
	    vector<bool> vis(V);
	    stack<int> s;
	    for(int i = 0; i < V; i++)
        {
	        if(!vis[i])
            {
	            dfs(i, vis, s, adj);
	        }
	    }

	    vector<int> res;

	    for(int i = 0; i < V; i++)
        {
	        res.push_back(s.top()); 
            s.pop();
	    }
	    return res;
	}
```

## Further Improvement / reading

text
