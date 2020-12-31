--- 
title: Note Created From One File
---

\newpage

# Heading 1
## Subheading 1
### Sub-subheading 1

The subheadings will be included only to a particular depth, which can be
configured by adding the `--toc-depth=N` argument to change the depth of the
TOC to N deep.

- Here
- Is
- A
- Bullet
- List

[Here is a link](https://example.com)

You can also link to another heading with modified link Markdown!
Click this to go to [Linked Heading 1][]

Pandoc has great documentation on the Markdown syntax they implement, very much
worth giving a read to see all the cool features that can be used!

https://pandoc.org/MANUAL.html

LaTeX can also be injected into the Markdown file, as seen above and below with
the `\newpage` directive I added to add a page break where I find I want to specify
to pandoc that the following text should be on a new page, eg the first one
creates a new page after the TOC so that it has its own title and TOC page.


\newpage
# Code Segment

Here's some code that I copied from Rosetta Code to show the code Highlighting!

```python
from functools import (reduce)
from operator import (add)
 
# pts :: Int -> [(Int, Int, Int)]
def pts(n):
    m = 1 + n
    return [(x, y, z) for x in xrange(1, m)
            for y in xrange(x, m)
            for z in xrange(y, m) if x**2 + y**2 == z**2]
 
# pts2 :: Int -> [(Int, Int, Int)]
def pts2(n):
    m = 1 + n
    return bindList(
        xrange(1, m)
    )(lambda x: bindList(
        xrange(x, m)
    )(lambda y: bindList(
        xrange(y, m)
    )(lambda z: [(x, y, z)] if x**2 + y**2 == z**2 else [])))
 
# pts3 :: Int -> [(Int, Int, Int)]
def pts3(n):
    m = 1 + n
    return concatMap(
        lambda x: concatMap(
            lambda y: concatMap(
                lambda z: [(x, y, z)] if x**2 + y**2 == z**2 else []
            )(xrange(y, m))
        )(xrange(x, m))
    )(xrange(1, m))
 
# GENERIC ---------------------------------------------------------
 
# concatMap :: (a -> [b]) -> [a] -> [b]
def concatMap(f):
    return lambda xs: (
        reduce(add, map(f, xs), [])
    )
 
# (flip concatMap)
# bindList :: [a] -> (a -> [b])  -> [b]
def bindList(xs):
    return lambda f: (
        reduce(add, map(f, xs), [])
    )
 
def main():
    for f in [pts, pts2, pts3]:
        print (f(20))
 
main()
```


\newpage
# Linked Heading 1

Here is an example of embedding an image into the notes! Enjoy this adorable
sleeping kitten!

![Cat Tax](images/Cat-Sleeping-Pic.jpg "LOOK AT THIS CAT!!!!")