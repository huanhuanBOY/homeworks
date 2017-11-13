import numpy as np
import math as mh
class hw5002_5:
    weight = np.array([0.125 for i in range(0,8)])
    def runRounds(self,CF,y0,VD):
        data = CF()
        self.weight = self.normlize()
        ER = self.getErrorRate(y0,data)
        CW = self.getClassifierWeight(ER)
        self.weight = self.getSampleWeightVector(VD,y0,data,CW)
        self.weight = self.normlize()
        return CW
    def getErrorRate(self,y0,y1):
        count =0
        for i in range(0,len(y0)):
            if y0[i] != y1[i]:
                count+=self.weight[i]
        return count
    
    def normlize(self):
        return self.weight/sum(self.weight)
        
    def getClassifierWeight(self,errorRate):
        return 1/float(2)*mh.log((1-errorRate)/errorRate)

    def getSampleWeightVector(self,VD,y0,y1,CW):
        vec = []
        sumD = sum(VD)
        for i in range(0,len(y0)):
            if y0[i] == y1[i]:
                vec.append(self.getCorSampleW(VD[i],sumD,CW))
            else:
                vec.append(self.getInCorSampleW(VD[i],sumD,CW))
        return vec

    def getCorSampleW(self,Di,Dsum,CW):
        return Di*mh.exp(-CW)/Dsum
    
    def getInCorSampleW(self,Di,Dsum,CW):
        return Di*mh.exp(CW)/Dsum
    
    def CF_1(self):
        return np.array([-1, -1, 1, 1, 1, 1, 1, -1])
    def CF_2(self):
        return np.array([-1, 1, 1, -1, 1, 1, -1, -1])
    def CF_3(self):
        return np.array([1, 1, 1, 1, 1, 1, 1, 1])
    def TrueResult(self):
        return np.array([-1, 1, 1, 1, -1, -1, 1, -1])

Obj = hw5002_5()
w1 = Obj.runRounds(Obj.CF_1,Obj.TrueResult(),Obj.weight)
w2 = Obj.runRounds(Obj.CF_2,Obj.TrueResult(),Obj.weight)
print (Obj.CF_1()*w1+Obj.CF_2()*w2)
print (w1+w2)/2