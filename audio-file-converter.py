import os
from pydub import AudioSegment

# Define the folder path containing the audio files
folder_path = 'path/to/your/folder'
output_folder = 'path/to/output/folder'

# Ensure the output folder exists
os.makedirs(output_folder, exist_ok=True)

# Iterate over each file in the folder
for filename in os.listdir(folder_path):
    # Construct full file path
    file_path = os.path.join(folder_path, filename)
    
    # Check if the file is an .aac or .m4a file
    if file_path.endswith(('.aac', '.m4a')):
        try:
            # Load the audio file using pydub
            audio = AudioSegment.from_file(file_path)
            
            # Construct the output file path
            output_file_path = os.path.join(output_folder, os.path.splitext(filename)[0] + '.wav')
            
            # Export the audio file as .wav
            audio.export(output_file_path, format='wav')
            print(f"Converted: {file_path} to {output_file_path}")
        
        except Exception as e:
            pass

print("Processing complete.")
