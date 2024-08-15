package io.mincong.shop.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * @author Petri Sadinmäki
 * @since 1.0
 */
@Path("/pingpong")
public class PingPongResource {

  @GET
  @Path("/getpingpong")
  @Produces(MediaType.TEXT_XML)
  public String jotain() {
    return "<xml><city>chicago</city><name>jon doe</name><age>22</age></xml>";
  }
}
