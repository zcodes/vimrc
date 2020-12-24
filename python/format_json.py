"""python filter to format json.

borrowed from python module json.tool"""
import argparse
import collections
import json
import sys
import io


def main():
    prog = 'python -m json.tool'
    description = ('A simple command line interface for json module ' 'to validate and pretty-print JSON objects.')
    parser = argparse.ArgumentParser(prog=prog, description=description)
    parser.add_argument('infile', nargs='?', type=argparse.FileType(), help='a JSON file to be validated or pretty-printed')
    parser.add_argument('outfile', nargs='?', type=argparse.FileType('w'), help='write the output of infile to outfile')
    parser.add_argument('--sort-keys', action='store_true', default=False, help='sort the output of dictionaries alphabetically by key')
    parser.add_argument('--decode-unicode', action='store_true', default=False, help='decode the encoded unicode data')
    options = parser.parse_args()

    infile = options.infile or io.TextIOWrapper(sys.stdin.buffer, encoding='utf-8')
    outfile = options.outfile or sys.stdout
    sort_keys = options.sort_keys
    decode_unicode = not options.decode_unicode
    with infile:
        try:
            if sort_keys:
                obj = json.load(infile)
            else:
                obj = json.load(infile, object_pairs_hook=collections.OrderedDict)
        except ValueError as e:
            raise SystemExit(e)
    with outfile:
        json.dump(obj, outfile, sort_keys=sort_keys, indent=4, ensure_ascii=decode_unicode)
        outfile.write('\n')


if __name__ == '__main__':
    main()
