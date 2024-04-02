# Navigating Ethics and Engagement in Visualizing the Holocaust through a Shiny App

# Overview

This Shiny app provides an interactive visualization of the ethnic origins and numbers of Holocaust victims, specifically focusing on those murdered at Auschwitz concentration camp. Drawing inspiration from Jamelle Bouie's 2022 article on the quantification of human tragedies, this project aims to honor the memory of the victims by presenting a dignified representation of the data, allowing users to explore specific groups based on categories such as birthplace, religion, birthdays, or regions.

# Website Link

<https://siqi-fei.shinyapps.io/Holocaust_Victims/>

# Features

-   Interactive Graphs: Utilize pie charts to display the proportion of victims from different categories.
-   Detailed Data Table: Offers an in-depth examination of the dataset, including victims' birthdays or regions.
-   User-driven Exploration: Users can specify groups they are interested in, fostering a personalized interaction with the data.
-   Ethical Data Representation: Emphasizes respectful and sensitive portrayal of Holocaust victims.

## File Structure

-   `Shiny-Visualization`:
    -   `Holocaust`:
        -   `app.R`:The main R script to launch the Shiny app. Contains UI and server definitions, along with logic to process and display the Holocaust victims' data interactively.
        -   `data`:
            -   `analysis_data.csv`:The cleaned and prepared dataset ready for analysis and visualization in the app. Contains details on the ethnic origins and numbers of Auschwitz victims.
            -   `raw_data`:
                -   `Auschwitz_Death_Certificates_1942-1943 - Auschwitz.csv`:Original dataset sourced from the Auschwitz Death Certificates of 1942-1943, prior to cleaning and processing.
        -   `paper`:
            -   `paper.qmd`:Quarto markdown file used for drafting the academic paper associated with this project.
            -   `Navigating Ethics and Engagement in Visualizing the Holocaust through a Shiny App.pdf`:The final version of the academic paper, compiled from paper.qmd, discussing the project's implications, ethical considerations, and the significance of interactive data visualization in historical research.
            -   `references.bib`:BibTeX file containing all the bibliographic references used in the academic paper. Ensures proper citation of sources and adherence to academic standards.
        -   `scripts/`:
            -   `00-data_clean.R`: Script dedicated to cleaning the raw Auschwitz Death Certificates dataset. Includes removal of missing values, filtering out placeholders, and standardizing categories.
            -   `01-data_test.R`:Script for testing the integrity and consistency of the cleaned data. Ensures the dataset is ready for analysis and visualization without any issues.
            -   `02-data_plotting.R`:Script for creating initial static plots from the cleaned data. Helps in understanding the dataset's distribution and preparing for dynamic visualization in the Shiny app.
        -   `other`:
            -   `llm/`:
                -   `usage.txt`: A detailed log file documenting the usage of language model tools throughout the research process.

## Data Source

Dataset for this app originates from the "Auschwitz Death Certificates" for the years 1942-1943, sourced from the United States Holocaust Memorial Museum (USHMM).

## License

This project is licensed under the MIT License. See the LICENSE file in the repository root for more information.

## Contact

For any queries regarding this study, please contact Siqi Fei at [fermi.fei\@mail.utoronto.ca](mailto:fermi.fei@mail.utoronto.ca){.email}. Further materials and updates can be found at [GitHub repository](https://github.com/FXXFERMI/Shiny-Visualization.git).

# LLM usage

This project used Large Language Models at paper.qmd and app.R. Some aspects of the code and essay were written with the help of Chat-GPT4 and the entire chat history is available in 'other/llm/usage.txt'
