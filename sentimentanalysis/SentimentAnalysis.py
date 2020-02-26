# Imports the Google Cloud client library
from google.cloud import language
from google.cloud.language import enums
from google.cloud.language import types

class SentimentAnalysis:

    ROBOT_LIBRARY_SCORE = 'TEST CASE'

    def analyze_sentiment_of_list(self, list):


        # Instantiates a client
        client = language.LanguageServiceClient()
        sumScore = 0
        sumMagnitude = 0
        size = len(list)
        results = []

        for i in list:
            # The text to analyze
            text = i
            document = types.Document(
                content=text,
                type=enums.Document.Type.PLAIN_TEXT)

            # Detects the sentiment of the text
            sentiment = client.analyze_sentiment(document=document).document_sentiment

            # print('Text: {}'.format(text))
            print('Sentiment: {}, {}'.format(sentiment.score, sentiment.magnitude))
            sumScore += sentiment.score
            sumMagnitude += sentiment.magnitude

        averageScore = sumScore / size
        averageMagnitude = sumMagnitude / size

        results.append(averageScore)
        results.append(averageMagnitude)

        return results


# ## This is a test run
#
# list = ["very good",
#         "i am very happy person and i love living",
#         "i want to commit suicide. I am not happy with my life",
#         "every little thing is gonna be okay",
#         "i am very sad person sad sad sad sad sad"]
#
# print(list)
# test = TestClass()
# result = test.analyzelist(list)
# print("averageScore = ", result[0])
# print("averageMagnitude = ", result[1])
#
