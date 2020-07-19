if($ENV:BHProjectName -and $ENV:BHProjectName.Count -eq 1) {
    Deploy Module {
        By PSGalleryModule {
            FromSource $ENV:BHProjectName
            To MurlocksRepo
            Tagged PSGallery
            WithOptions @{
                ApiKey = $ENV:PSGalleryApiKey
            }
        }
    }
}
