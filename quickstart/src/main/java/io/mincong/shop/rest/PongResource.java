package io.mincong.shop.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * @author Petri Sadinmäki
 * @since 1.0
 */
@Path("/pong")
public class PongResource {

  @GET
  @Produces(MediaType.APPLICATION_JSON)
  public String pong() {
    return "{\"city\":\"chicago\",\"name\":\"jon doe\",\"age\":\"22\"}";
  }
}
