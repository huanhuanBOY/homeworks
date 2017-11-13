# KNN based on categories, Not numerical
# Author: Huan Wei
import math
import numpy as np
class hw5002_1:
    def getDistanceArray(self,data,item):
        dis_arr = []
        for i in data:
            dis_arr.append((i[0],self.itemDistance(i,item),i[len(i)-1]))
        return sorted(dis_arr,key=lambda x : x[1])
    def itemDistance(self, it1, it2):
        su = 0
        for i in range(1,len(it1)-1):
            if it1[i] != it2[i]:
# category distance: 0 for the same, 1 for different
                su += 1
        return su
    def getClass(self,data,keys,item):
        if keys >= (len(data)-1):
            return None
        distance = self.getDistanceArray(data,item)
        choosed = {}
        for i in range(0,keys):
            if choosed.get(distance[i][2]):
                choosed[distance[i][2]]["num"] += 1
                choosed[distance[i][2]]["list"].append(distance[i][0])
            else:
                choosed[distance[i][2]] = {"num":1,"list":[distance[i][0]]}
        maxNum = 0
        classType = None
        classIndex = -1
        for i in choosed:
            if choosed[i]["num"] > maxNum:
                classType = i
                maxNum = choosed[i]["num"]
            elif choosed[i]["num"] == maxNum:
                if classType > i:
                    classType = i
        return classType
    def getListClass(self,traindata,testData,keys):
        result = []
        for i in testData:
            result.append(self.getClass(traindata,keys,i))
        return result
    def getData(self):
        Traindata = [[1,"English","Alex","Network","1","20","High"],
        [2,"non-English","David","Database","2","20","High"],
        [3,"non-English","David","Programming","2","20","Medium"],
        [4,"non-English","Bob","Database","2","50","Low"],
        [5,"non-English","David","Programming","2","30","High"],
        [6,"non-English","Alex","Network","1","30","High"],
        [7,"non-English","Alex","Database","2","10","Low"],
        [8,"non-English","David","Programming","2","20","Medium"],
        [9,"non-English","Alex","Network","1","20","Medium"],
        [10,"non-English","Bob","Algorithm","2","40","Medium"],
        [11,"English","Alex","Network","2","40","Low"],
        [12,"English","David","Database","1","10","Low"],
        [13,"non-English","Bob","Programming","2","40","Medium"],
        [14,"English","Bob","Algorithm","2","30","Medium"]]

        TestData = [[15,"English","David","Algorithm","2","50","High"],
        [16,"non-English","Bob","Network","2","50","Medium"],
        [17,"English","Bob","Database","1","50","High"],
        [18,"non-English","David","Algorithm","1","10","Medium"],
        [19,"English","Alex","Network","2","30","Low"],
        [20,"non-English","Alex","Programming","1","20","Medium"]]
        return np.array(Traindata),np.array(TestData)
    def accuracy(self,source,predict):
        print predict
        count = 0
        for i in range(0,len(source)):
            if source[i]==predict[i]:
                count +=1
        return count/float(len(source))
Obj = hw5002_1()
Traindata,Testdata = Obj.getData()
key = 4
1 - Obj.accuracy(Testdata[:,len(Testdata[0])-1],Obj.getListClass(Traindata,Testdata,key))