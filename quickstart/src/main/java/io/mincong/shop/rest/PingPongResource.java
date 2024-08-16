package io.mincong.shop.rest;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * @author Petri Sadinmäki
 * @since 1.0
 */
@Path("/pingpong")
public class PingPongResource {

  @GET
  @Path("/get")
  @Produces(MediaType.TEXT_XML)
  public String getXml() {
    return "<xml><city>chicago</city><name>jon doe</name><age>22</age></xml>";
  }

  @POST
  @Path("/set/{name}")
  @Produces(MediaType.TEXT_PLAIN)
  public String setString(@PathParam("name") String name) {
    return "Your name is " + name;
  }

  @POST
  @Path("/settwo/{firstname}/{lastname}")
  @Produces(MediaType.TEXT_PLAIN)
  public String setTwoStrings(@PathParam("firstname") String firstname, @PathParam("lastname") String lastname) {
    return "Your name is " + firstname + " " + lastname;
  }
}
