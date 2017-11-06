package com.yizhan.controller.barrage.util;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * Created by 一线生 on 2015/11/22.
 * 说明：
 */
public class JsonUtil {
    private static ObjectMapper mapper = new ObjectMapper();

    /**
     * 对象toJSON
     * @param object
     * @return
     * @throws IOException 
     * @throws JsonMappingException 
     * @throws JsonGenerationException 
     */
    public static String getString(Object object) throws JsonGenerationException, JsonMappingException, IOException {
        try {
            return mapper.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return "";
        }
    }

    /**
     * json转换Bean
     * @param json
     * @param clazz
     * @param <T>
     * @return
     */
    public static <T> T getBean(String json, Class<T> clazz) {
        try {
            return mapper.readValue(json, clazz);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
