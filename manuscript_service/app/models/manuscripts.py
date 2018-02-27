import numpy as np
import csv

nums = ['1','2','5','100','200']
with open('test.csv','w') as f:
    writer = csv.writer(f, lineterminator='\n')
    writer.writerow(nums)
    print("success!")
