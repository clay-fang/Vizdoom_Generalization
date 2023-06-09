# Vizdoom_Generalization

a platform for generalization in rl

In the Vizdoom_Generalization environment, there are 3 different sizes of maps, with a piece of wall as the basic unit, the sizes are 9x9, 11x11, and 13x13. The larger the map size, the more difficult the task is, the more significant the corresponding sparse reward problem is, and the more demanding the performance of the algorithm is. Under the same size and same task type, the training task set contains 50 maps and the test task set contains 10 maps.

<p align="center">
  <img width="460" src="https://github.com/clay-fang/Vizdoom_Generalization/blob/main/viz_g.png">
</p>

In the Vizdoom_Generalization environment, two different task types are set: "random target location" and "fixed target location", provided that the initial location of the intelligence does not overlap with the target location of the task.  In each round, the map layout does not change and the agent appears randomly at the location of a white point in the overhead view. 

In "randomized target location" the task target also appears at a random location of a white point. 

In "target location fixation", the task target is fixed at the location of a white point. 

## Map

create your environment map

```
cd Vizdoom_Generalization
./export_random.sh
./export_static.sh
```

 map files will be in `outputs_random`  and  `outputs_static`folder.

## Run

run random agent in our static_9x9_0 train_map

```train
from vizdoomenv import VizdoomEnv       #导入封装类   
benchmark={'level':'static', 'size':'9_TRAIN', 'idx':0}   #任务类型、地图尺寸及编号
env = VizdoomEnv(benchmark['level'], benchmark['size'], benchmark['idx'])  #创建环境
done = False
for i in range(10):
    obs = env.reset()      #初始化环境
    while not done:
        action = random(n)     #随机动作
        next_obs, reward, done, info = env.step(action) #与环境进行交互，返回第一视角图像obs，与对应奖励值reward。当回合结束时，返回done=True，反之为False。info包含调试时需要使用的信息。
        obs = next_obs 
env.close()           #结束环境
```
