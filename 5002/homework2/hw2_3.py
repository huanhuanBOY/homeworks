import numpy as np
class hw5002_3:
    def getIndenpentProSet(self,data):
        probSet = {}
        probTuple = {}
        probType = {}
        for i in data:
            for t in i:
                if probSet.get(t):
                    probSet[t] += 1
                else:
                    probSet[t] = 1
                if probTuple.get((t,i[len(i)-1])):
                     probTuple[(t,i[len(i)-1])] +=1
                else:
                    probTuple[(t,i[len(i)-1])] = 1
        for i in data[:,len(data[0])-1]:
            if probType.get(i):
                probType[i] +=1
            else:
                probType[i] = 1
        for i in probType:
            probType[i] = probType[i]/float(len(data))
        for i in probSet:
            probSet[i] = probSet[i]/float(len(data))
        for i in probTuple:
            probTuple[i] = probTuple[i]/float(len(data))
        return probSet,probTuple,probType
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
        [14,"English","Bob","Algorithm","2","30","Medium"],
        [15,"English","David","Algorithm","2","50","High"],
        [16,"non-English","Bob","Network","2","50","Medium"],
        [17,"English","Bob","Database","1","50","High"],
        [18,"non-English","David","Algorithm","1","10","Medium"],
        [19,"English","Alex","Network","2","30","Low"],
        [20,"non-English","Alex","Programming","1","20","Medium"]]
        return np.array(Traindata)
    def getBayesProb(self,test,_type,probSet,probTuple,probType):
        pro1 = 1
        pro2 = 1
        for i in test:
            if probSet.get(i) and probTuple.get((i,_type)):
                pro1 *= probSet[i]
                pro2 *= probTuple[(i,_type)]
            else:
                return 0
        return pro2 * float(probType[_type]) / pro1
    def getBayesProbList(self, data, TA):
        prob = Obj.getIndenpentProSet(data[:,1:])
        _type = None
        maxP = 0
        for i in prob[2]:
            temp = Obj.getBayesProb(TA,i,prob[0],prob[1],prob[2])
            if maxP < temp:
                _type = i
                maxP = temp
        return _type
Obj = hw5002_3()
data = Obj.getData()
TA = ["non-English","David","Database","2"]
print Obj.getBayesProbList(data, TA)