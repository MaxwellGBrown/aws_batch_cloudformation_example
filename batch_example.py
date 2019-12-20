"""An example command to run in a docker container."""
import itertools
import sys
import time


def main(number):
    """Do the thing!"""
    counter = itertools.count()
    while (x := next(counter)) < number:
        print(x + 1)
        time.sleep(1)
    print("Done!")


if __name__ == "__main__":
    # batch_example.py <input>
    print(sys.argv)
    main(int(sys.argv[1]))
