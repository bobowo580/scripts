import time
import os

timestamp = time.strftime("%Y%m%d%H%M%S",time.localtime())
save_media = '1'   # set save_media = '' will not save response body separately

dumpfile = "E:\\mitm\\flow_" + timestamp + ".dump"
media_save_path = "E:\\mitm\\media_dump_" + timestamp
url_keyword = "88888888"   # set url_keyword to dump specified requests

def request(flow):
    if -1 == flow.request.url.find(url_keyword):
        return
    time_FB = time.localtime(flow.request.timestamp_start)
    time_LB = time.localtime(flow.request.timestamp_end)
    with open(dumpfile, 'a', newline='') as f:
        f.write(time.strftime("%Y-%m-%d %H:%M:%S", time_FB) + ", " + time.strftime("%Y-%m-%d %H:%M:%S", time_LB) + "\n")
        f.write(flow.request.method + " " + flow.request.path + "\n")
        for k, v in flow.request.headers.items():
            f.write("%s: %s\n" %(k,v))
        f.write("\n")
    f.closed


def response(flow):
    if -1 == flow.request.url.find(url_keyword):
        return
    time_FB = time.localtime(flow.response.timestamp_start)
    time_LB = time.localtime(flow.response.timestamp_end)
    time_str = time.strftime("%Y-%m-%d %H:%M:%S", time_FB) + ", " + time.strftime("%Y-%m-%d %H:%M:%S", time_LB) + "\n"
    code_str = flow.response.http_version + " " + str(flow.response.status_code) + " " + flow.response.reason + "\n"
    with open(dumpfile, 'ab') as f:
        f.write(time_str.encode())
        f.write(code_str.encode())
        for k, v in flow.response.headers.items():
            header_str = "%s: %s\n" %(k,v)
            f.write(header_str.encode())
        f.write(flow.response.content)
        f.write(b'\n')
    f.closed
    
    if save_media:
        seg_name = os.path.basename(flow.request.path).split('?')[0]
        tmp_file = media_save_path + "\\"  +  seg_name
        with open(tmp_file,'wb') as f:
            f.write(flow.response.content)
        f.closed

if save_media and not os.path.exists(media_save_path):
    os.makedirs(media_save_path)




