# Vizdoom_Generalization
a platform for generalization in rl
## Usage

```
cd Vizdoom_Generalization
./export_random.sh
./export_static.sh
```

That's it! WAD map files will be in `outputs_random`  and  `outputs_static`folder.


## Configuration

`maze.py` generates random maze sources, `wad.py` compiles mazes into a single WAD file. `export.sh` is a simple wrapper to compile ACC and generate some example mazes.

```
usage: maze.py [-h] [-n NUM] [-s SPLIT] [-r ROWS] [-c COLUMNS] maze

positional arguments:
  maze

optional arguments:
  -h, --help            show this help message and exit
  -n NUM, --num NUM     number of maps to generate (default: 10)
  -s SPLIT, --split SPLIT
                        train/test split ratio (default: 0.8)
  -r ROWS, --rows ROWS  maps row size (default: 9)
  -c COLUMNS, --columns COLUMNS
                        maps column size (default: 9)
```

```
usage: wad.py [-h] [-b BEHAVIOR] [-s SCRIPT] prefix wad

positional arguments:
  prefix
  wad

optional arguments:
  -h, --help            show this help message and exit
  -b BEHAVIOR, --behavior BEHAVIOR
                        path to compiled lump containing map behavior
                        (default: None)
  -s SCRIPT, --script SCRIPT
                        path to script source lump containing map behavior
                        (optional)
```
