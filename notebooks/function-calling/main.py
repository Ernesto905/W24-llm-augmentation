import streamlit as st
import custom_weather_llm as weather

st.title("Fit recommender for any activity!")

location = st.sidebar.text_area(label="Where are you planning on going?", max_chars=30)
activity = st.sidebar.text_area(label="What activity do you plan on doing?", max_chars=30)


### LLM Config 
msg = f"What's the weather like in {location} and what's the air pressure and wind speed there? I want to perform the following activity {activity}, can you suggest an outfit for me?"
tools = [
    {
        "type": "function",
        "function": {
            "name": "get_current_weather",
            "description": "Get a json string with the current weather conditions at a given location. MUST pass in the input as CITY, STATE. e.g. Mountain View, CA.",
            "parameters": {
                "type": "object",
                "properties": {
                    "location": {
                        "type": "string",
                        "description": "The city and state, e.g. San Francisco, CA",
                    },
                },
                "required": ["location"],
            },
        },   
    }
]
messages = [
    {
        "role": "user",
        "content": msg
    }
]

### END LLM Config


if location and activity:
    response = weather.get_completion(messages, tools=tools)
    parsed_response = weather.parse_response(response, msg, tools)
    # st.text(parsed_response)
    st.text_area(label="response", value=parsed_response, height=300)
    


    if st.button('Show Illustration'):
        prompt = f"""
            Generate an image of clothing as defined below. Take care to make it as realistic as possible. Do not miss any of the clothing gear, check to see that everything is included in the image: 
            {parsed_response}
        """
        st.caption("Please note, this may take up to a minute. Be patient dawg.")
        image_url = weather.generate_image(prompt=prompt)
        st.image(image_url, caption='Generated Image', use_column_width=True)



