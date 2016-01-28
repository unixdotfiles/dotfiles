import os
import ycm_core

flags = [
        '-Wall',
        '-Wextra',
        '-pedantic']

c_flags = [
        '-std=c11',
        '-x',
        'c',
        ]

cpp_flags = [
        '-std=c++14',
        '-x',
        'c++',
        ]

def FlagsForFile(filename, **kwargs):
    all_flags = flags
    if filename.endswith(".c"):
        all_flags += c_flags
    if filename.endswith(".cpp"):
        all_flags += cpp_flags

    return {
            'flags': all_flags,
            'do_cache': True

        }
