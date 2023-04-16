# Vizdoom_Generalization

a platform for generalization in rl

<p align="center">
  <img width="460" src="https://github.com/clay-fang/Vizdoom_Generalization/blob/main/viz_g.png">
</p>

## Map

create your environment map

```
cd Vizdoom_Generalization
./export_random.sh
./export_static.sh
```

 map files will be in `outputs_random`  and  `outputs_static`folder.

## Run

'''
from vizdoomenv import VizdoomEnv       #导入封装类   
benchmark={'level':'static', 'size'=9, 'idx'=0}   #任务类型、地图尺寸及编号
env = VizdoomEnv(benchmark['level'], benchmark['size'], benchmark[' idx '])  #创建环境
done = False
for i in range(10):
obs = env.reset()                      #初始化环境
while not done:
action = random(n)                #随机动作
obs, reward, done, info = env.step(action)             #与环境进行交互，返回第一视角图像obs，与对应奖励值reward。当回合结束时，返回done=True，反之为False。info包含调试时需要使用的信息。
env.close()                                #结束环境
'''
