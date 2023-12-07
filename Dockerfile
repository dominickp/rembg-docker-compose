FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

RUN apt-get update
RUN apt-get install python3.10 -y
RUN apt-get install python-is-python3 -y
RUN apt-get install pip -y

RUN pip install rembg[gpu,cli] onnxruntime-gpu
RUN python -c 'from rembg.bg import download_models; download_models()'

ENTRYPOINT ["rembg"]
CMD ["--help"]
