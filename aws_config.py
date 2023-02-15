import boto3

# Specify your AWS Region
aws_region='<aws_region>'

# Create a low-level SageMaker service client.
sagemaker_client = boto3.client('sagemaker', region_name=aws_region)

# Role to give SageMaker permission to access AWS services.
sagemaker_role= "arn:aws:iam::<region>:<account>:role/*"


# secret: H8vg8Fih2+oU7bnDdfYafODRlFZanvzXEBYo7Kjk
# access AKIAZU5WK4NNUIBQLGPR