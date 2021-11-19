import chevron
import os
import sys

if __name__ == "__main__":
    print(chevron.render("hello {{name}} from python {{version}}", {
        "name": os.environ.get("NAME", "you"),
        "version": sys.version
        }))
