import { test, expect, type Page } from '@playwright/test';
import { XMLParser } from 'fast-xml-parser';


test.describe('JAX-RS API tests', () => {
    const xmlParser = new XMLParser();
    test('should return 204 from ping', async ({ request }) => {
        const newIssue = await request.head(`/ping`, {

        });
        expect(newIssue.status()).toBe(204);
    });

    test('should return json from "pong"', async ({ request }) => {
        const newIssue = await request.get(`/pong`, {

        });

        expect(newIssue.status()).toBe(200);
        expect(await newIssue.json()).toEqual(expect.objectContaining({
            city: 'chicago',
            name: 'jon doe',
            age: "22"
          }));
    });

    test('should return xml from "pingpong"', async ({ request }) => {
        const newIssue = await request.get(`/pingpong/get`, {

        });

        expect(newIssue.status()).toBe(200);
        const rawData = await newIssue.text();
        
        const xml = xmlParser.parse(rawData)['xml'];
        expect(xml).toEqual(expect.objectContaining({
            city: 'chicago',
            name: 'jon doe',
            age: 22
          }));
    });

    test('should post string "pingpong"', async ({ request }) => {
        const name = 'Firstname'
        const newIssue = await request.post(`/pingpong/set/${name}`, {

        });
        expect(newIssue.status()).toBe(200);
        expect(await newIssue.text()).toEqual(`Your name is ${name}`);
    });

    test('should post two strings "pingpong"', async ({ request }) => {
        const firstName = 'Firstname'
        const lastName = 'Lastname'
        const newIssue = await request.post(`/pingpong/settwo/${firstName}/${lastName}`, {

        });

        expect(newIssue.status()).toBe(200);
        expect(await newIssue.text()).toEqual(`Your name is ${firstName} ${lastName}`);
    });

});