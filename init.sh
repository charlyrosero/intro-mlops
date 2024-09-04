#!/bin/bash

gunicorn --bind 0.0.0.0 api.main:app -w 4 -k uvicorn.workers.UvicornWorker --reload
 
 