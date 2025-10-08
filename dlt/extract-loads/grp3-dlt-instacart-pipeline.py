# dlt/pipeline.py
import dlt, pandas as pd
import os

# https://archive.ics.uci.edu/dataset/9/auto+mpg
@dlt.resource(name="assessments")
def mpg():
   
    
    #yield pd.read_csv("https://raw.githubusercontent.com/cj-a-murillo/ftw-de-bootcamp-grp3/refs/heads/main/OULAD-dataset/assessments.csv").astype(str)
    
    # How to load a local CSV
    # Place file in staging\auto-mpg folder
    ROOT_DIR = os.path.dirname(__file__)
    STAGING_DIR = os.path.join(ROOT_DIR, "staging", "oulad")
    FILE_PATH = os.path.join(STAGING_DIR, "assessments.csv")
    yield pd.read_csv(FILE_PATH).astype(str)
    
    # How to load an excel file
    #FILE_PATH = os.path.join(STAGING_DIR, "mpg.xlsx")
    #yield pd.read_excel(FILE_PATH).astype(str)

def run():
    p = dlt.pipeline(
        pipeline_name="grp3-dlt-oulad-pipeline",
        destination="clickhouse",
        dataset_name="oulad_grp3",
    )
    print("Fetching and loading...")
    info1 = p.run(mpg())          # dlt pulls creds from env-vars

    print("records loaded:", info1)


if __name__ == "__main__":
    run()