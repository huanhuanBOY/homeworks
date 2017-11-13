# Decision tree based on ID3 and C4.5
# Author: Huan Wei
import numpy as np
import math as mh
# Node List class, tree nodes
class ListNode(object):
    def __init__(self, name):
        # name is the decision attribute
        self.name = name
        # branch is to store the child nodes
        self.branch = []
        # to store the value of decision tree, only valid in leaf nodes
        self.value = None

class hw5002_2:
    
# gather the max_gain attributes' information, to split tree
# example: {'Programming': {'High': 1, 'Medium': 4, '_rows': [2, 4, 7, 12, 19]}, 'Network': {'High': 2, 'Medium': 2, '_rows': [0, 5, 8, 10, 15, 18], 'Low': 2}, 'Algorithm': {'High': 1, 'Medium': 3, '_rows': [9, 13, 14, 17]}, 'Database': {'High': 2, '_rows': [1, 3, 6, 11, 16], 'Low': 3}}
    def getname_space(self,arr,index):
        temp2 = {}
        last_col = len(arr[0]) - 1
        for t in range(0, len(arr)):
            if temp2.get(arr[t][index]):
                if temp2[arr[t][index]].get(arr[t][last_col]):
                    temp2[arr[t][index]][arr[t][last_col]] += 1
                    temp2[arr[t][index]]["_rows"].append(t)
                else:
                    temp2[arr[t][index]][arr[t][last_col]] = 1
                    temp2[arr[t][index]]["_rows"].append(t)
            else:
                temp2[arr[t][index]] = {arr[t][last_col]:1,"_rows":[t]}
        return temp2

# To caculate and compare all Gain, and decide which attribute to split
    def split_info(self,arr,algorithmType):
        max_index = 0
        max_Gain = 0
        info_T = self.info_T(arr[:,len(arr[0])-1])
        for i in range(0,len(arr[0])-1):
            if algorithmType=="ID3":
                temp = self.GainID3(arr,info_T,i)
            else:
                temp = self.GainC45(arr,info_T,i)
            if temp > max_Gain:
                max_Gain = temp
                max_index = i
        return max_Gain,max_index

# To caculate one attribute's Gain
    def GainID3(self,arr,info_T,attr_index):
        info = self.info_one_attr(arr,attr_index)
        return  info_T - info

    def GainC45(self,arr,info_T,attr_index):
        t = self.info_T(arr[:,attr_index])
        if t == 0:
            return 0
        info = self.info_one_attr(arr,attr_index)
        return  (info_T - info)/t

# To caculate info_T
    def info_T(self,arr):
        ty = {}
        info_sum = 0
        for i in arr:
            if ty.get(i):
                ty[i] = ty[i] + 1
            else:
                ty[i] = 1
        return self.caculate_info_sum(ty,len(arr))
    
# To caculate one attribute's info, one attribute(contains several values) is sum up by several values' info.
    def info_one_attr(self,arr,attr_index):
        nameSet = {}
        for item in arr:
            if nameSet.get(item[attr_index]):
                nameSet[item[attr_index]] += 1
            else:
                nameSet[item[attr_index]]=1
        sum_info = 0
        for name in nameSet:
            sum_info += nameSet[name]/float(len(arr)) * self.info_one_val(arr,name,nameSet[name],attr_index)
        return sum_info
    
# To caculate one value's info
    def info_one_val(self,arr,name_x,name_sum,attr_index):
        y = {}
        y_index = len(arr[0])-1
        for i in range(0,len(arr)):
            if arr[i][attr_index] == name_x:
                if y.get(arr[i][y_index]):
                    y[arr[i][y_index]] += 1
                else:
                    y[arr[i][y_index]] = 1
        return self.caculate_info_sum(y, name_sum)
    
# Avoid duplicate codes, a help function
    def caculate_info_sum(self, obj, base):
        info_sum = 0
        for i in obj:
            info_sum = info_sum - obj[i]/float(base) * mh.log(obj[i]/float(base),2)
        return info_sum

# select rows and columns when decide how to split tree
    def select_row_col(self,arr,x_y_info,index):
        return np.delete(arr[x_y_info["_rows"]], index, 1)

    def getData(self):
        data = [["Sunny","Hot","High","Weak","No"],
                ["Sunny","Hot","High","Strong","No"],
                ["Overcast","Hot","High","Weak","Yes"],
                ["Rain","Mild","High","Weak","Yes"],
                ["Rain","Cool","Normal","Weak","Yes"],
                ["Rain","Cool","Normal","Strong","No"],
                ["Overcast","Cool","Normal","Strong","Yes"],
                ["Sunny","Mild","High","Weak","No"],
                ["Sunny","Cool","Normal","Weak","Yes"],
                ["Rain","Mild","Normal","Weak","Yes"],
                ["Sunny","Mild","Normal","Strong","Yes"],
                ["Overcast","Mild","High","Strong","Yes"],
                ["Overcast","Hot","Normal","Weak","Yes"],
                ["Rain","Mild","High","Strong","No"]]
        data1 = [["English","Alex","Network","1","20","High"],
                ["non-English","David","Database","2","20","High"],
                ["non-English","David","Programming","2","20","Medium"],
                ["non-English","Bob","Database","2","50","Low"],
                ["non-English","David","Programming","2","30","High"],
                ["non-English","Alex","Network","1","30","High"],
                ["non-English","Alex","Database","2","10","Low"],
                ["non-English","David","Programming","2","20","Medium"],
                ["non-English","Alex","Network","1","20","Medium"],
                ["non-English","Bob","Algorithm","2","40","Medium"],
                ["English","Alex","Network","2","40","Low"],
                ["English","David","Database","1","10","Low"],
                ["non-English","Bob","Programming","2","40","Medium"],
                ["English","Bob","Algorithm","2","30","Medium"],
                ["English","David","Algorithm","2","50","High"],
                ["non-English","Bob","Network","2","50","Medium"],
                ["English","Bob","Database","1","50","High"],
                ["non-English","David","Algorithm","1","10","Medium"],
                ["English","Alex","Network","2","30","Low"],
                ["non-English","Alex","Programming","1","20","Medium"]]
        return np.array(data1)

# To generate a decision tree
    def get_decision_tree(self,data,father,algorithmType):
        # choose a attr to split
        choose = self.split_info(data,algorithmType)
        # get the attr's information (ex.number of values)
        temp = self.getname_space(data,choose[1])
        # split the tree
        for i in temp:
            currentNode = ListNode(i)
            father.branch.append(currentNode)
            if len(temp[i]) > 2:
                self.get_decision_tree(self.select_row_col(data,temp[i],choose[1]),currentNode,algorithmType)
            # end of one branch
            else:
                for t in temp[i]:
                    if t != "_rows":
                        currentNode.value = t
    
    def print_tree(self,currentnode):
        t = len(currentnode.branch)
        print currentnode.name
        if t == 0:
            print "Leaf Point, value --> "+str(currentnode.value)
            return
        for i in range(0,t):
            self.print_tree(currentnode.branch[i])
Obj = hw5002_2()
data = Obj.getData()
Tree_Head = ListNode("root")
# Obj.get_decision_tree(data,Tree_Head,"ID3")
Obj.get_decision_tree(data,Tree_Head,"C45")
Obj.print_tree(Tree_Head)
