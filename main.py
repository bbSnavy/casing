#!/usr/bin/python3


split      = lambda s: s.split()
join       = lambda l, s: s.join(l)
lowercase  = lambda s: s.lower()
uppercase  = lambda s: s.upper()


casePascalMap = lambda s: uppercase(s[0:1]) + lowercase(s[1:]) if s else ""
casePascal    = lambda s: join(map(casePascalMap, split(s)), "")
caseSnake     = lambda s: join(map(lowercase, split(s)), "-") if s else ""
caseCamel     = lambda s: (lambda v: lowercase(v[0:1]) + v[1:])(casePascal(s)) if s else ""


def main():
    _input = input()

    print(casePascal(_input))
    print(caseSnake(_input))
    print(caseCamel(_input))


if __name__ == '__main__':
    main()