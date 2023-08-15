import argparse
import os
import sys

'''
Make chapter RTL directory
'''

THIS_DIR = os.path.dirname(os.path.abspath(__file__))
GIT_TOP = os.path.join(THIS_DIR, "..")
sys.path.append(GIT_TOP)
import lib_package.pythonPack as pyPack # noqa


def parser():
  parse = argparse.ArgumentParser(description="Make chapter RTL directory")
  parse.add_argument("--group", type=str, required=True, help="Group number")
  parse.add_argument("--topNum", type=str, required=True, help="Top verilog files number")
  parse.add_argument("--dir", type=pyPack.checkPath.validPathType, default=pyPack.checkPath.validPathType(f"{GIT_TOP}/hdlbits-exam"))
  return parse


def main(args):
  print(args)
  args.update({"targetGroup": os.path.join(args.get('dir'), f"group-{args.get('group')}")})
  if not os.path.isdir(args.get("targetGroup")):
    os.makedirs(args.get("targetGroup"))

  for each in range(int(args.get('topNum'))):
    tmpPath = os.path.join(args.get('targetGroup'), f"exam{args.get('group')}-{each}")
    if not os.path.isdir(tmpPath):
      os.makedirs(tmpPath)
      with open(os.path.join(tmpPath, "top_module.v"), 'w') as f_rtl:
        f_rtl.write("")


if __name__ == "__main__":
  args = vars(parser().parse_args())
  main(args=args)
