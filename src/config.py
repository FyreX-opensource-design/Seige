from config_io import Config
import os
global config

def __init__():

    cfg_path = '../../klipper/printer_data/config/SeigeDisplay.yaml'

    config = Config.load_from_file(cfg_path)

    if not os.path.exists(cfg_path):
        file = open(cfg_path)
        file.write('heater_1: extruder\n')
        file.write('heater_bed: bed\n')
        file.close

def config_read(key):
    if key == 'heater_1':
        result = config['heater_1']
    if key == 'heater_bed':
        result = config['heater_bed']
    return result