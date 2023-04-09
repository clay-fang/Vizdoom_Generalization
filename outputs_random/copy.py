
old_file = open('7_TRAIN_0.cfg', mode='r')
lines = old_file.readlines()
for index in range(1,83):
    new_file = open('7_TRAIN_{}.cfg'.format(index), mode='w')
    for line in lines:
        if 'doom_scenario_path' in line:
            line = "doom_scenario_path = 7_TRAIN.wad"
        if 'doom_map' in line:
            line = "doom_map = map{:02d}.wad".format(index)
        new_file.write(line)
    new_file.close()
old_file.close()