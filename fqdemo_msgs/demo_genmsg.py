#!/bin/python3

import fnmatch
import os
import time
import sys

# Demo of ROS genmsg
import genmsg

def _find_files_with_extension(path, ext):
    matches = []
    for root, dirnames, filenames in os.walk(path):
        for filename in fnmatch.filter(filenames, '*.%s' % ext):
            #matches.append(os.path.join(root, filename))
            matches.append((os.path.splitext(filename)[0], os.path.join(root, filename)))
    return matches

def resource_name(resource):
    if '/' in resource:
        val = tuple(resource.split('/'))
        if len(val) != 2:
            raise ValueError("invalid name [%s]" % resource)
        else:
            return val
    else:
        return '', resource

def generate_msg_doc(msg, msg_context, msg_template, path):
    package, base_type = resource_name(msg)
    d = {'name': msg, 'ext': 'msg', 'type': 'Message',
         'package': package, 'base_type': base_type,
         'date': str(time.strftime('%a, %d %b %Y %H:%M:%S'))}
    spec = genmsg.msg_loader.load_msg_from_file(msg_context, path, "%s/%s" % (package, base_type))
    print(f'spec:\n{spec}')
    print(f'spec.fields():\n{spec.fields()}')
    #d['fancy_text'] = _generate_msg_text(package, base_type, msg_context, spec)
    #d['raw_text'] = _generate_raw_text(spec.text)
    #return msg_template % d

def main():

    msgs = _find_files_with_extension('./msg', 'msg')
    print(f'msgs: {msgs}')
    msg_context = genmsg.msg_loader.MsgContext.create_default()
    print(f'msg_context: {msg_context}')
    msg_d = os.path.join('dummy_output', 'msg')

    for m, msg_path in msgs:
        try:
            package, base_type = resource_name(m)
            msg_template = None
            text = generate_msg_doc('%s/%s'%(package,m), msg_context, msg_template, msg_path)
            print(f'text:\n{text}')
            #file_p = os.path.join(msg_d, '%s.html' % m)
            #with open(file_p, 'w') as f:
                #print("writing", file_p)
                #f.write(text)
        except Exception as e:
            print("FAILED to generate for %s/%s: %s" % (package, m, str(e)), file=sys.stderr)

if __name__ == '__main__':
    main()
