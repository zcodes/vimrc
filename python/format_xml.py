#!/usr/bin/env python
# -*- coding: utf-8 -*-

import io
import sys
from xml.dom.minidom import parse


def main():
    stdin = io.TextIOWrapper(sys.stdin.buffer, encoding='utf-8')

    with sys.stdout:
        sys.stdout.write('\n'.join([
            line for line in parse(stdin).toprettyxml(indent=' '*4).split('\n') if line.strip()
        ]))


if __name__ == '__main__':
    main()
