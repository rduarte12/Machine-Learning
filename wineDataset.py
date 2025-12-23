# codigo para baixar o iris dataset de mopdo mais facil

import numpy as np
import os
import pandas as pd

s = "https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data"

df = pd.read_csv(s, header=None, encoding='utf-8')

output_dir = "./datasets"

df.to_csv(os.path.join(output_dir, "wine.csv"), index=False)