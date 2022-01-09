from minio import Minio
from minio.error import S3Error
import uuid

def uploadFile():
    result = ""
    bucket_name = "upload-bucket"
    file_name = "uploded_file_" + str(uuid.uuid1()) + ".txt"

    client = Minio(
        "localhost:9000",
        access_key="minioadmin",
        secret_key="minioadmin",
        secure=False  # For demo purposes only
    )

    found = client.bucket_exists(bucket_name)
    if not found:
        client.make_bucket(bucket_name)
    else:
        result = "Bucket '" + bucket_name + "' already exists"

    client.fput_object(
        bucket_name, file_name, "./upload_files/file_to_be_uploaded.txt",
    )
    result =  "'./upload_files/file_to_be_uploaded.txt' is successfully uploaded as object '" + file_name + "' to bucket '" + bucket_name + "'."
    
    return result

if __name__ == "__main__":
    try:
        uploadFile()
    except S3Error as exc:
        print("error occurred.", exc)