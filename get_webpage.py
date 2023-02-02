import pandas as pd

def get_webpage(url):
    try:
        df = pd.read_html(url)
    except ValueError:
        print("data found in webpage")
    else:
        return df