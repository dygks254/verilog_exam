import argparse, os, subprocess, json

'''
Make chapter RTL directory
'''

THIS_DIR = os.path.dirname(os.path.abspath(__file__))  

def parser():
  parse = argparse.ArgumentParser(description="Make chapter RTL directory")
  parse.add_argument("--group", type=str, required=True, help="Group number")
  parse.add_argument("--topNum", type=str, required=True, help="Top verilog files number")
  return parse

def main(args):
  print(args)


if __name__ == "__main__":
  args = vars(parser().parse_args())
  main(args=args)