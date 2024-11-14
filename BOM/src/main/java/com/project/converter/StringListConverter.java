/*
 * package com.project.converter;
 * 
 * import java.util.List; import javax.persistence.AttributeConverter; import
 * javax.persistence.Converter; import
 * com.fasterxml.jackson.core.type.TypeReference; import
 * com.fasterxml.jackson.databind.ObjectMapper;
 * 
 * @Converter public class StringListConverter implements
 * AttributeConverter<List<String>, String> {
 * 
 * private final ObjectMapper objectMapper = new ObjectMapper();
 * 
 * @Override public String convertToDatabaseColumn(List<String> attribute) { try
 * { return objectMapper.writeValueAsString(attribute); } catch (Exception e) {
 * throw new RuntimeException("Failed to convert list to JSON string", e); } }
 * 
 * @Override public List<String> convertToEntityAttribute(String dbData) { try {
 * return objectMapper.readValue(dbData, new TypeReference<List<String>>() {});
 * } catch (Exception e) { throw new
 * RuntimeException("Failed to convert JSON string to list", e); } } }
 */