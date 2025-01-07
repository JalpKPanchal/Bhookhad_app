package com.service;

import com.bean.NominatimResponse;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Service
public class GeocodingService {

    private final String NOMINATIM_URL = "https://nominatim.openstreetmap.org/search?q={address}&format=json&limit=1";

    public String[] getLatLongFromAddress(String address) throws Exception {
        RestTemplate restTemplate = new RestTemplate();
        String url = NOMINATIM_URL.replace("{address}", address.replace(" ", "+"));

        // Make the API call
        String response = restTemplate.getForObject(url, String.class);

        // Parse the response using Jackson
        ObjectMapper objectMapper = new ObjectMapper();
        List<NominatimResponse> results = objectMapper.readValue(response, new TypeReference<List<NominatimResponse>>() {});

        // Check if results are found
        if (!results.isEmpty()) {
            String lat = results.get(0).getLat();
            String lon = results.get(0).getLon();
            return new String[]{lat, lon};
        } else {
            throw new Exception("Address not found");
        }
    }
}
