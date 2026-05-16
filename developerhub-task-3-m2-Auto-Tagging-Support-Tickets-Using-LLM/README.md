# Auto Tagging Support Tickets with Gemini
---
## Findings and Analysis

This project demonstrates how a large language model (LLM) like Gemini can be used to automatically tag customer support tickets. We explored two primary techniques: **zero-shot learning** and **few-shot learning**, to compare their effectiveness.

### Zero-Shot Learning Performance

Zero-shot learning relies on a prompt alone, with no examples provided to the model. Gemini was given the task of classifying tickets into a predefined set of tags.

The model showed good results in understanding the core intent of most tickets. For example:
* A ticket about a dropping internet connection was correctly tagged as `Network Issue` and `Technical Issue`.
* A billing address change request was tagged with `Billing and Payments` and `Account Management`.

However, zero-shot performance can be inconsistent. It may occasionally suggest less relevant tags or fail to capture the primary intent if the language is ambiguous. For instance, a software bug ticket might be broadly categorized as a `Technical Issue` but miss the specific `Software Bug` tag in some cases.

### Few-Shot Learning Performance

Few-shot learning involves providing the model with a few examples of well-tagged tickets. This guides the model to better understand the task, the specific tags, and the desired output format.

The results with few-shot learning showed a noticeable improvement in accuracy and consistency. The model was more precise in its classifications and better at differentiating between related but distinct issues. The examples helped the model to:
* Accurately identify `Software Bug` over just a general `Technical Issue`.
* More reliably rank the most probable tags.

### Conclusion and Future Work

Zero-shot and few-shot learning are effective, low-cost methods for text classification using an LLM. Few-shot learning generally provides better results by providing clear examples.

For production systems, the next logical step would be **fine-tuning** an LLM on a large, labeled dataset of your specific support tickets. However, this is a very resource-intensive task and requires a significant amount of data and computational power. It's important to note that the latest Gemini models, particularly **Gemini 1.5 Pro and Flash**, do not currently support fine-tuning. For these models, **few-shot learning** is the most effective approach for domain-specific tasks.

### Output
Here are the zero-shot and few-shot tagging results for the sample tickets.

#### Zero-Shot Tags
* **Ticket:** 'My internet connection keeps dropping every few minutes, and I can't stay on a video call. It seems to be a hardware issue with the router.'
    * **Tags:** Network Issue, Technical Issue, Hardware Issue
* **Ticket:** 'I need to change my billing address. The last payment was declined. Please help me update my account details.'
    * **Tags:** Billing and Payments, Account Management, Technical Issue
* **Ticket:** 'The software crashes every time I try to save a new document. I'm using version 2.1 on Windows 10.'
    * **Tags:** Software Bug, Technical Issue, Account Management
* **Ticket:** 'My account is locked, and I can't reset my password. I'm not receiving the password reset email.'
    * **Tags:** Account Management, Technical Issue, Network Issue
* **Ticket:** 'I'd like to request a new feature: a dark mode option for the mobile app.'
    * **Tags:** Feature Request, Account Management, Software Bug
* **Ticket:** 'I have been charged twice for the same subscription, and I want a refund for one of the payments.'
    * **Tags:** Billing and Payments, Refund Request, Account Management
* **Ticket:** 'My screen is frozen and the application is not responding. I've tried restarting but it didn't help.'
    * **Tags:** Technical Issue, Software Bug, Account Management
* **Ticket:** 'I am unable to access my files after the latest software update. The files are gone from the dashboard.'
    * **Tags:** Technical Issue, Software Bug, Account Management

#### Few-Shot Tags
* **Ticket:** 'My internet connection keeps dropping every few minutes, and I can't stay on a video call. It seems to be a hardware issue with the router.'
    * **Tags:** Network Issue, Technical Issue, Hardware Issue
* **Ticket:** 'I need to change my billing address. The last payment was declined. Please help me update my account details.'
    * **Tags:** Billing and Payments, Account Management, Technical Issue
* **Ticket:** 'The software crashes every time I try to save a new document. I'm using version 2.1 on Windows 10.'
    * **Tags:** Software Bug, Technical Issue, Account Management
* **Ticket:** 'My account is locked, and I can't reset my password. I'm not receiving the password reset email.'
    * **Tags:** Account Management, Technical Issue, Network Issue
* **Ticket:** 'I'd like to request a new feature: a dark mode option for the mobile app.'
    * **Tags:** Feature Request, Account Management, Software Bug
* **Ticket:** 'I have been charged twice for the same subscription, and I want a refund for one of the payments.'
    * **Tags:** Billing and Payments, Refund Request, Account Management
* **Ticket:** 'My screen is frozen and the application is not responding. I've tried restarting but it didn't help.'
    * **Tags:** Technical Issue, Software Bug, Account Management
* **Ticket:** 'I am unable to access my files after the latest software update. The files are gone from the dashboard.'
    * **Tags:** Technical Issue, Software Bug, Account Management
